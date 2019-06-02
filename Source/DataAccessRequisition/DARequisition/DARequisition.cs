namespace DataAccessRequisition.DARequisition
{
    using Entities.Entities;
    using System;
    using System.Configuration;
    using System.Data;
    using System.Data.SqlClient;
    using System.Globalization;

    public class DARequisition
    {
        /// <summary>
        /// Insert requisition on database
        /// </summary>
        /// <param name="requisition"></param>
        /// <returns></returns>
        public string CreateRequisition(Requisition requisition)
        {
            string result = string.Empty;
            int status = default(int);
            string connectionString = ConfigurationSettings.AppSettings["AlphaCredit"].ToString();

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SP_CREATE_REQUISITION", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@CreditTypeId", requisition.CreditTypeId);
                    cmd.Parameters.AddWithValue("@CustomerId", requisition.CustomerId);
                    cmd.Parameters.AddWithValue("@Amount", requisition.Amount);
                    cmd.Parameters.AddWithValue("@Term", requisition.Term);
                    cmd.Parameters.AddWithValue("@Quota", requisition.Quota);

                    status = cmd.ExecuteNonQuery();

                    result = status == 1 ? "Solicitud aceptada" : "Solcicitd Rechazada";
                }

                return result;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        /// <summary>
        /// Get customer Incomes
        /// </summary>
        /// <param name="customerId"></param>
        /// <returns></returns>
        public double GetCustomerIncomes(int customerId)
        {
            string result = string.Empty;
            double incomes = default(double);
            string connectionString = ConfigurationSettings.AppSettings["AlphaCredit"].ToString();

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("SP_GET_CUSTOMER_INCOMES", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@CustomerId", customerId);

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        incomes = double.Parse(dr["MonthlyIncomes"].ToString(), NumberStyles.Currency);
                    }
                }

                return incomes;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
    }
}
