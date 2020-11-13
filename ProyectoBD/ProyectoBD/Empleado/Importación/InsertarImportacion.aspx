﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/Importación/MPImportacion.master" AutoEventWireup="true" CodeBehind="InsertarImportacion.aspx.cs" Inherits="ProyectoBD.Empleado.Importación.InsertarImportacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contenidoPrincipal" runat="server">
     <link href="../../App_Themes/estilo1.css" rel="stylesheet" />
    <h2>Insertar Importación</h2>

    <div>
         <div class="form-wrapper">
            <form action="">

                    <div class="inputBox">
                        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="txtnombre" runat="server" Text = "Nombre" ForeColor = "Gray" onfocus = "clearWaterMark('Nombre',this);" onblur = "createWaterMark('Nombre',this);" onkeypress="return soloLetras(event);" Width="461px"></asp:TextBox>
                        <asp:TextBox ID="txtcantidad" runat="server" Text = "Cantidad" ForeColor = "Gray" onfocus = "clearWaterMark('Cantidad',this);" onblur = "createWaterMark('Cantidad',this);" onkeypress="return justNumbers(event);" Width="461px"></asp:TextBox>
                        <asp:TextBox ID="txtpeso" runat="server" Text = "Peso" ForeColor = "Gray" onfocus = "clearWaterMark('Peso',this);" onblur = "createWaterMark('Peso',this);" onkeypress="return justNumbers(event);" Width="461px"></asp:TextBox>
                        <asp:TextBox ID="txtfechae" runat="server" Text = "Fecha de entrega" ForeColor = "Gray" onfocus = "clearWaterMark('Fecha de entrega',this);" onblur = "createWaterMark('Fecha de entrega',this);" Width="461px"></asp:TextBox>
                        <asp:TextBox ID="txtfechape" runat="server" Text = "Fecha de pedido" ForeColor = "Gray" onfocus = "clearWaterMark('Fecha de pedido',this);" onblur = "createWaterMark('Fecha de pedido',this);" Width="461px"></asp:TextBox>
                        <asp:TextBox ID="txtdescrip" runat="server" Text = "Descripción" ForeColor = "Gray" onfocus = "clearWaterMark('Descripción',this);" onblur = "createWaterMark('Descripción',this);" onkeypress="return soloLetras(event);" Width="461px"></asp:TextBox>
                        <br />
                        Nombre Contribuyente:
                        <asp:DropDownList ID="ddlcont" runat="server" OnSelectedIndexChanged="ddlcont_SelectedIndexChanged"></asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblCont" runat="server"></asp:Label>
                        <br />
                        País:&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlpais" runat="server"></asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblpais" runat="server"></asp:Label>
                        <br />
                        Tipo de producto:&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlproducid" runat="server"></asp:DropDownList>
                        <script type ="text/javascript">
                            function clearWaterMark(defaultText, textBoxControl) {
                                if (textBoxControl.value == defaultText) {
                                    textBoxControl.value = "";
                                    textBoxControl.style.color = "Black";
                                }
                            }
                            function createWaterMark(defaultText, textBoxControl) {
                                if (textBoxControl.value.length == 0) {
                                    textBoxControl.value = defaultText;
                                    textBoxControl.style.color = "Gray";
                                }
                            }
                            function onKeyDecimal(e, thix) {
                                var keynum = window.event ? window.event.keyCode : e.which;
                                if (document.getElementById(thix.id).value.indexOf('.') != -1 && keynum == 46)
                                    return false;
                                if ((keynum == 8 || keynum == 48 || keynum == 46))
                                    return true;
                                if (keynum <= 47 || keynum >= 58) return false;
                                return /\d/.test(String.fromCharCode(keynum));
                            }

                            function justNumbers(e) {
                                var keynum = window.event ? window.event.keyCode : e.which;
                                if ((keynum == 8 || keynum == 48))
                                    return true;
                                if (keynum <= 47 || keynum >= 58) return false;
                                return /\d/.test(String.fromCharCode(keynum));
                            }

                            function soloLetras(evt) {
                                var charCode = (evt.which) ? evt.which : event.keyCode
                                if (charCode > 31 && (charCode < 48 || charCode > 57))
                                    return true;

                                return false;
                            }

                            function ValidaDecimal(dato) {
                                var valor = dato.indexOf(",");
                                if ((window.event.keyCode > 47 && window.event.keyCode < 58) || window.event.keyCode == 44) {
                                    if (window.event.keyCode == 44) {
                                        if (valor >= 0) {
                                            window.event.returnValue = false;
                                        }
                                    }
                                } else {
                                    window.event.returnValue = false;
                                }
                            }
                        </script>
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblproduc" runat="server"></asp:Label>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        &nbsp;<br />
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Mostrar códigos" Height="53px" Width="158px" />
                        <br />
                        <br />

                    </div>
                      
                    <br />
                    <asp:Button ID="btnInsertar" runat="server" Text="Insertar Importacion" OnClick="btnInsertar_Click" />
&nbsp;</form>
      </div>
    </div>
</asp:Content>
