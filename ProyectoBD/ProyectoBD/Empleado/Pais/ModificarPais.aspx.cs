﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

namespace ProyectoBD.Empleado.Pais
{
    public partial class ModificarPais : System.Web.UI.Page
    {
        OracleConnection ora = new OracleConnection("DATA SOURCE = xe; PASSWORD = 123; USER ID = LU;");
        protected void Page_Load(object sender, EventArgs e)
        {
            ora.Open();
            if (!IsPostBack)
            {
                Combo();
            }
        }
        private void Combo()
        {
            string cadena = "SELECT * FROM PAIS";
            OracleCommand comando = new OracleCommand(cadena, ora);
            OracleDataAdapter adaptador = new OracleDataAdapter(comando);
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            ComboBox1.DataSource = tabla;
            ComboBox1.DataTextField = "NOMBRE";
            ComboBox1.DataValueField = "ID_PAIS";
            ComboBox1.DataBind();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Label2.Text = ComboBox1.SelectedValue.ToString();
            OracleCommand comando = new OracleCommand("SELECT nombre, region FROM PAIS WHERE ID_PAIS = " + Label2.Text, ora);
            OracleDataAdapter adaptador = new OracleDataAdapter();
            adaptador.SelectCommand = comando;
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            GridView1.DataSource = tabla;
            GridView1.DataBind();
        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                OracleCommand actualizar = new OracleCommand("UPDATE PAIS SET nombre ='" + txtnombre.Text + "',region='" + txtregion.Text + "' WHERE ID_PAIS ='" + Label2.Text + "'", ora);
                OracleDataAdapter dtaa = new OracleDataAdapter();
                dtaa.UpdateCommand = actualizar;
                dtaa.UpdateCommand.ExecuteNonQuery();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Modificado correctamente')</script>");
            }
            catch
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Error al modificar')</script>");
            }
        }
    }
}