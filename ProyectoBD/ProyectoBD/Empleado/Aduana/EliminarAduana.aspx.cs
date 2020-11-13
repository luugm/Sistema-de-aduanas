﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;

namespace ProyectoBD.Empleado.Aduana
{
    public partial class EliminarAduana : System.Web.UI.Page
    {
        OracleConnection ora = new OracleConnection("DATA SOURCE = xe; PASSWORD = 123; USER ID = LU;");
        protected void Page_Load(object sender, EventArgs e)
        {
            ora.Open();
            if (!IsPostBack)
            {
                Combobox1();
            }
        }
        private void Combobox1()
        {
            string cadena = "SELECT * FROM ADUANA";
            OracleCommand comando = new OracleCommand(cadena, ora);
            OracleDataAdapter adaptador = new OracleDataAdapter(comando);
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            //ddlcont.DataSource = Consultar("SELECT * FROM CONTRIBUYENTE");
            DropDownList1.DataSource = tabla;
            DropDownList1.DataTextField = "UBICACION";
            DropDownList1.DataValueField = "ID_ADU";
            DropDownList1.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Label1.Text = DropDownList1.SelectedValue.ToString();
            OracleCommand comando = new OracleCommand("SELECT ubicacion, impuesto FROM ADUANA WHERE ID_ADU = " + Label1.Text, ora);
            OracleDataAdapter adaptador = new OracleDataAdapter();
            adaptador.SelectCommand = comando;
            DataTable tabla = new DataTable();
            adaptador.Fill(tabla);
            dataGridView1.DataSource = tabla;
            dataGridView1.DataBind();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                OracleCommand eliminar = new OracleCommand("DELETE FROM ADUANA WHERE ID_ADU ='" + Label1.Text + "'", ora);
                OracleDataAdapter dtaa = new OracleDataAdapter();
                dtaa.DeleteCommand = eliminar;
                dtaa.DeleteCommand.ExecuteNonQuery();
                Response.Write("<script LANGUAGE='JavaScript' >alert('Eliminado correctamente')</script>");
            }
            catch(Exception ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('No se pudo eliminar')</script>");
            }
        }
    }
}