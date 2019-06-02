namespace BusinessRequisition.BLCustomer
{
    using DataAccessRequisition.DACustomer;
    using Entities.Entities;

    public class BLCustomer
    {
        /// <summary>
        /// Create customer
        /// </summary>
        /// <param name="customer"></param>
        /// <returns>Message</returns>
        public string AddCustomer(Customer customer)
        {
            DACustomer daCustomer = new DACustomer();
            return daCustomer.AddCustomer(customer);
        }
    }
}
