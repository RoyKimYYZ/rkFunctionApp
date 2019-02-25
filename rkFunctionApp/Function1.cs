using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Host;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;

namespace rkFunctionApp
{
    public static class Function1
    {
        [FunctionName("GetRecipes")]
        public static async Task<HttpResponseMessage> Run([HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", Route = null)]HttpRequestMessage req, TraceWriter log)
        {
            log.Info("C# HTTP trigger function processed a request.");

            // parse query parameter
            string name = req.GetQueryNameValuePairs()
                .FirstOrDefault(q => string.Compare(q.Key, "name", true) == 0)
                .Value;

            if (name == null)
            {
                // Get request body
                dynamic data = await req.Content.ReadAsAsync<object>();
                name = data?.name;
            }

            string content = String.Empty;
            ArrayList list = new ArrayList();
            bool hasRows;

            // Get the connection string from app settings and use it to create a connection.
            var str = Environment.GetEnvironmentVariable("DatabaseConnectionString");
            log.Info(String.Format("{0} connection string", str));
            using (SqlConnection conn = new SqlConnection(str))
            {
                conn.Open();
                var text = "SELECT * FROM recipes";

                using (SqlCommand cmd = new SqlCommand(text, conn))
                {
                    // Execute the command and log the # rows affected.
                    SqlDataReader rows = await cmd.ExecuteReaderAsync();
                    log.Info($"{rows.HasRows} has rows");

                    if (rows.HasRows)
                    {
                        while (rows.Read())
                        {
                            log.Info($"{rows.GetInt32(0)}\t{rows.GetString(1)}");
                            list.Add(rows.GetString(1));
                        }
                    }
                    else
                    {
                        log.Info($"No rows found.");
                    }

                    hasRows = rows.HasRows;
                    content = JsonConvert.SerializeObject(list);

                }
            }
            
            return !hasRows
                ? req.CreateResponse(HttpStatusCode.BadRequest, "Bad request")
                : req.CreateResponse(HttpStatusCode.OK, content, "application/json");
        }
    }
}
