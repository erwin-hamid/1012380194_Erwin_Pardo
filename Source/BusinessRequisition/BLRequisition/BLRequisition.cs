namespace BusinessRequisition.BLRequisition
{
    using DataAccessRequisition.DARequisition;
    using Entities.Entities;
    using System;

    public class BLRequisition
    {
        /// <summary>
        /// Const to Interest Rate
        /// </summary>
        private double InterestRate = 0.021;

        /// <summary>
        /// Create Requisition
        /// </summary>
        /// <param name="requisition"></param>
        /// <returns>Message</returns>
        public string CreateRequisition(Requisition requisition)
        {
            DARequisition daRequisition = new DARequisition();
            string result = string.Empty;

            try
            {
                requisition.Quota = this.CalculateQuota(requisition);

                if (this.ValidateQuotaincomes(requisition))
                {
                    if (requisition.CreditTypeId == 2 && this.ValidateAmount(requisition))
                    {
                        result = "Compras realizadas superan el monto solicitado.";
                        return result;
                    }
                }
                else
                {
                    result = "Cuota fija supera el 50% de los ingresos.";
                    return result;
                }

                result = daRequisition.CreateRequisition(requisition);
            }
            catch (Exception ex)
            {
                result = ex.Message;
            }

            return result;
        }

        /// <summary>
        /// Validate "Compra de Cartera"
        /// </summary>
        /// <param name="requisition"></param>
        /// <returns></returns>
        private bool ValidateAmount(Requisition requisition)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Validate fifty percent incomes-quota
        /// </summary>
        /// <param name="requisition"></param>
        /// <returns>message</returns>
        private bool ValidateQuotaincomes(Requisition requisition)
        {
            DARequisition daRequisition = new DARequisition();
            bool message;

            double incomes = daRequisition.GetCustomerIncomes(requisition.CustomerId);

            message = incomes == -1 ||
                      requisition.Quota > (incomes / 2)   
                      ? false : true;

            return message;
        }

        /// <summary>
        /// Calciulate the quota to pay
        /// Cuota Fija =[(tasa)(monto)] /[1 - (1 + tasa) ^ -plazo]
        /// </summary>
        /// <param name="requisition"></param>
        /// <returns>Quota</returns>
        private double CalculateQuota(Requisition requisition)
        {
            double quota = default(double);
            quota = (InterestRate * requisition.Amount) / (1 - Math.Pow((1 + InterestRate), -requisition.Term));
            return quota;
        }
    }
}
