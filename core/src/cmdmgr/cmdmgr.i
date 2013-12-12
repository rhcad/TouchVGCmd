%module(directors="1") cmdmgr

%{
#include <mgbox.h>
#include <mgmat.h>
#include <mgbnd.h>
#include <mgbase.h>
#include <mgcurv.h>
#include <mglnrel.h>
#include <mgnear.h>

#include <gigraph.h>
#include <gicanvas.h>
#include <gipath.h>

#include <mgshapes.h>
#include <mgbasicsp.h>
#include <mgcomposite.h>
#include <mggrid.h>
#include <mgshapetype.h>
#include <mgstorage.h>
#include <mgspfactory.h>

#include <mgaction.h>
#include <mglockdata.h>
#include <mgsnap.h>
#include <mgselect.h>
#include <mgaction.h>
#include <mglockdata.h>
#include <mgcmd.h>
#include <cmdsubject.h>

#include <mgcmdmgr.h>
#include <mgcmdmgrfactory.h>
%}

%include <mgdef.h>
%include <mgtol.h>
%include <mgvec.h>
%include <mgpnt.h>
%include <mgmat.h>
%include <mgbox.h>
%include <mgbnd.h>

%include <mgbase.h>
%include <mgcurv.h>
%include <mglnrel.h>
%include <mgnear.h>

%feature("director") GiCanvas;
%include <gicanvas.h>

%include <gicolor.h>
%include <gicontxt.h>
%include <gixform.h>
%include <gipath.h>
%include <gigraph.h>

%include <mgobject.h>
%include <mgshape.h>
%include <mgspfactory.h>
%include <mgshapes.h>
%include <mgbasicsp.h>
%include <mgcomposite.h>
%include <mggrid.h>
%include <mgshapetype.h>
%include <mgstorage.h>
%include <mgspfactory.h>

%include <mgaction.h>
%include <mglockdata.h>
%include <mgsnap.h>
%include <mgselect.h>
%include <mgview.h>

%feature("director") MgCommand;
%include <mgcmd.h>

%feature("director") CmdObserverDefault;
%include <cmdobserver.h>
%include <cmdsubject.h>

%include <mgcmdmgr.h>
%include <mgcmdmgrfactory.h>
