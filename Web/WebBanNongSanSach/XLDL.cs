using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; //lấy chuỗi kết nối ở web.config

namespace WebBanNongSanSach
{
    public class XLDL
    {
        public static string strCon = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();

        //Trả về table
        public static DataTable GetData(string lenhSQL)
        {
            SqlConnection sqlCon = new SqlConnection(strCon);
            try
            {
                SqlDataAdapter sqlDa = new SqlDataAdapter(lenhSQL, sqlCon);
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Thực hiện lệnh Insert, Update, Delete
        public static void Execute(string lenhSQL)
        {
            using (SqlConnection sqlCon = new SqlConnection(strCon))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand(lenhSQL, sqlCon);
                sqlCmd.ExecuteNonQuery();
                sqlCon.Close();
            }
        }

        //Trả về 1 giá trị
        public static string GetValue(string lenhSQL)
        {
            using (SqlConnection sqlCon = new SqlConnection(strCon))
            {
                sqlCon.Open();
                SqlCommand sqlCmd = new SqlCommand(lenhSQL, sqlCon);
                string value = sqlCmd.ExecuteScalar().ToString();
                sqlCon.Close();
                return value;
            }
        }

        // Kiểm tra SQL Injection 
        public static bool CheckSqlInjection(string userValue)
        {
            // Throw an exception if a blacklisted word is detected.
            String[] blackList = {
                                            "alter",
                                            "begin",
                                            "cast",
                                            "create",
                                            "cursor",
                                            "declare",
                                            "delete",
                                            "drop",
                                            "exec",
                                            "execute",
                                            "fetch",
                                            "insert",
                                            "kill",
                                            "open",
                                            "select",
                                            "sys",
                                            "sysobjects",
                                            "syscolumns",
                                            "table",
                                            "update",
                                            "<script",
                                            "</script",
                                            "--",
                                            "/*",
                                            "*/",
                                            "@@",
                                            "@",
                                            "'"
                                        };
            for (int i = 0; i < blackList.Length; i++)
            {
                if (userValue.ToLower().IndexOf(blackList[i]) != -1)
                {
                    return true;
                }
            }
            return false;
        }
    }
}