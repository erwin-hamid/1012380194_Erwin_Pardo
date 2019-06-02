namespace DataAccessRequisition.DACustomer
{
    using Entities.Entities;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;

    public class DACustomer
    {
        /// <summary>
        /// Insert customer on database
        /// </summary>
        /// <param name="customer"></param>
        /// <returns>Message</returns>
        public string AddCustomer(Customer customer)
        {
            string result = string.Empty;
            int status = default(int);
            string connectionString = ConfigurationSettings.AppSettings["AlphaCredit"].ToString();

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_INSERT_CUSTOMER", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@IdentificationTypeId", customer.IdentificationType);
                    cmd.Parameters.AddWithValue("@Identification", customer.Identification);
                    cmd.Parameters.AddWithValue("@Names", customer.Names);
                    cmd.Parameters.AddWithValue("@LastNames", customer.LastNames);
                    cmd.Parameters.AddWithValue("@Birthdate", customer.Birthdate);
                    cmd.Parameters.AddWithValue("@GenderId", customer.Gender);
                    cmd.Parameters.AddWithValue("@CivilStatusId", customer.CivilStatus);
                    cmd.Parameters.AddWithValue("@Address", customer.Address);
                    cmd.Parameters.AddWithValue("@PhoneNumbers", customer.PhoneNumbers);
                    cmd.Parameters.AddWithValue("@CompanyName", customer.Company);
                    cmd.Parameters.AddWithValue("@CompanyPhones", customer.CompanyPhones);
                    cmd.Parameters.AddWithValue("@CompanyWorkTime", customer.CompanyWorkTime);
                    cmd.Parameters.AddWithValue("@MonthlyIncomes", customer.MonthlyIncomes);

                    status = cmd.ExecuteNonQuery();

                    result = status == 1 ? "Cliente Registrado" : "Cliente No registrado";
                }

                return result;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
