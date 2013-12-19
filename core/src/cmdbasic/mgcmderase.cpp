// mgcmderase.cpp: 实现橡皮擦命令类
// Copyright (c) 2004-2013, Zhang Yungui
// License: LGPL, https://github.com/rhcad/touchvg

#include "mgcmderase.h"
#include <algorithm>
#include <functional>
#include "mgshapet.h"
#include "mgbasicsp.h"
#include "mgaction.h"

bool MgCmdErase::cancel(const MgMotion* sender)
{
    m_boxsel = false;
    bool ret = backStep(sender);
    ret = backStep(sender) || ret;
    return backStep(sender) || ret;
}

bool MgCmdErase::initialize(const MgMotion*, MgStorage*)
{
    m_boxsel = false;
    return true;
}

bool MgCmdErase::backStep(const MgMotion* sender)
{
    if (!m_delIds.empty()) {
        m_delIds.pop_back();
        sender->view->redraw();
        return true;
    }
    if (m_boxsel) {
        m_boxsel = false;
        return true;
    }
    return false;
}

bool MgCmdErase::draw(const MgMotion* sender, GiGraphics* gs)
{
    if (m_boxsel) {
        GiContext ctxshap(0, GiColor(0, 0, 255, 80), 
                          isIntersectMode(sender) ? kGiLineDash : kGiLineSolid, GiColor(0, 0, 255, 24));
        gs->drawRect(&ctxshap, Box2d(sender->startPtM, sender->pointM));
    }
    
    GiContext ctx(-4, GiColor(64, 64, 64, 128));
    
    for (std::vector<int>::const_iterator it = m_delIds.begin(); it != m_delIds.end(); ++it) {
        const MgShape* shape = sender->view->shapes()->findShape(*it);
        if (shape) {
            shape->draw(1, *gs, &ctx, -1);
        }
    }
    
    return true;
}

int MgCmdErase::gatherShapes(const MgMotion* sender, MgShapes* shapes)
{
    if (m_boxsel) {
        MgShapeT<MgRect> shape;
        
        GiContext ctxshap(0, GiColor(0, 0, 255, 128), 
                          isIntersectMode(sender) ? kGiLineDash : kGiLineSolid, GiColor(0, 0, 255, 32));
        *shape.context() = ctxshap;
        ((MgRect*)shape.shape())->setRect2P(sender->startPtM, sender->pointM);
        shapes->addShape(shape);
    }
    return m_boxsel ? 1 : 0;
}

const MgShape* MgCmdErase::hitTest(const MgMotion* sender)
{
    Box2d limits(sender->startPtM, sender->displayMmToModel(6.f), 0);
    MgHitResult res;
    return sender->view->shapes()->hitTest(limits, res);
}

bool MgCmdErase::click(const MgMotion* sender)
{
    MgShape* shape = const_cast<MgShape*>(hitTest(sender));
    if (shape && sender->view->shapeWillDeleted(shape)) {
        MgShapesLock locker(MgShapesLock::Remove, sender->view);
        if (locker.locked() && sender->view->removeShape(shape)) {
            shape->release();
            sender->view->regenAll();
        }
    }
    
    return true;
}

bool MgCmdErase::longPress(const MgMotion* sender)
{
    int actions[] = { 0 };
    return sender->view->showContextActions(0, actions, Box2d(sender->point, 0, 0), NULL);
}

bool MgCmdErase::touchBegan(const MgMotion* sender)
{
    m_boxsel = true;
    sender->view->redraw();
    return true;
}

bool MgCmdErase::isIntersectMode(const MgMotion*)
{
    return true;
    //return (sender->startPt.x < sender->point.x
    //        && sender->startPt.y < sender->point.y);
}

bool MgCmdErase::touchMoved(const MgMotion* sender)
{
    Box2d snap(sender->startPtM, sender->pointM);
    MgShapeIterator it(m_boxsel ? sender->view->shapes() : NULL);
    
    m_delIds.clear();
    while (const MgShape* shape = it.getNext()) {
        if (isIntersectMode(sender) ? shape->shapec()->hitTestBox(snap)
            : snap.contains(shape->shapec()->getExtent())) {
            m_delIds.push_back(shape->getID());
        }
    }
    sender->view->redraw();
    
    return true;
}

bool MgCmdErase::touchEnded(const MgMotion* sender)
{
    MgShapes* s = sender->view->shapes();
    
    if (!m_delIds.empty()
        && sender->view->shapeWillDeleted(s->findShape(m_delIds.front()))) {
        MgShapesLock locker(MgShapesLock::Remove, sender->view);
        int count = 0;
        std::vector<int>::iterator it;
        
        it = locker.locked() ? m_delIds.begin() : m_delIds.end();
        for (; it != m_delIds.end(); ++it) {
            MgShape* shape = const_cast<MgShape*>(s->findShape(*it));
            if (shape && sender->view->removeShape(shape)) {
                shape->release();
                count++;
            }
        }
        if (count > 0) {
            sender->view->regenAll();
        }
    }
    
    m_delIds.clear();
    m_boxsel = false;
    sender->view->redraw();
    
    return true;
}
