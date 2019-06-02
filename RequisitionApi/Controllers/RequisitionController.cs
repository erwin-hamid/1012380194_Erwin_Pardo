namespace RequisitionApi.Controllers
{
    using BusinessRequisition.BLRequisition;
    using Entities.Entities;
    using System.Net;
    using System.Web.Http;

    [RoutePrefix("api/requisition")]
    public class RequisitionController : ApiController
    {
        [Route("CreateRequisition")]
        [HttpPost]
        public IHttpActionResult CreateRequisition(Requisition requisition)
        {
            BLRequisition blRequisition = new BLRequisition();
            string result = blRequisition.CreateRequisition(requisition);

            return Content(HttpStatusCode.OK, result);
        }
    }
}
