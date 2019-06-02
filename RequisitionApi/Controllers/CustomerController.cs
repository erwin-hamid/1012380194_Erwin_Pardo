namespace RequisitionApi.Controllers
{
    using BusinessRequisition.BLCustomer;
    using Entities.Entities;
    using System.Net;
    using System.Web.Http;

    [RoutePrefix("api/customer")]
    public class CustomerController : ApiController
    {
        [Route("AddCustomer")]
        [HttpPost]
        public IHttpActionResult AddCustomer(Customer customer)
        {
            BLCustomer blCustomer = new BLCustomer();
            string result = blCustomer.AddCustomer(customer);

            return Content(HttpStatusCode.OK, result);
        }
    }
}
