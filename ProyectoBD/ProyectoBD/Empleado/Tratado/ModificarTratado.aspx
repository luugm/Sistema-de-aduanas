﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Empleado/Tratado/MPTratado.master" AutoEventWireup="true" CodeBehind="ModificarTratado.aspx.cs" Inherits="ProyectoBD.Empleado.Tratado.ModificarTratado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contenidoPrincipal" runat="server">
    <link href="../../App_Themes/estilo1.css" rel="stylesheet" />
    <h2>Modificar Aduana</h2>

    <div>
         <div class="form-wrapper">
            <form action="">
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
                    <div class="inputBox">
                        Seleccione aduana:
                        <asp:DropDownList ID="ComboBox1" runat="server">
                            <asp:ListItem Text="--Seleccionar--" Value="0"></asp:ListItem>
                        </asp:DropDownList>
&nbsp;<asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Height="53px" Text="Buscar" OnClick="Button2_Click" />
                        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <br />
                        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                        <asp:TextBox ID="txtnombre" runat="server" Text = "Nombre del tratado" ForeColor = "Gray" onfocus = "clearWaterMark('Nombre del tratado',this);" onblur = "createWaterMark('Nombre del tratado',this);" onkeypress="return soloLetras(event);" Width="461px"></asp:TextBox>
                        <asp:TextBox ID="txtdescrip" runat="server" Text = "Descripción" ForeColor = "Gray" onfocus = "clearWaterMark('Descripción',this);" onblur = "createWaterMark('Descripción',this);" onkeypress="return soloLetras(event);" Width="461px"></asp:TextBox>
                        <asp:TextBox ID="txtfechae" runat="server" Text = "Fecha de emisión" ForeColor = "Gray" onfocus = "clearWaterMark('Fecha de emisión',this);" onblur = "createWaterMark('Fecha de emisión',this);" Width="461px"></asp:TextBox>
                        <br />
                        <br />
                        Aduana:&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="ddladuana" runat="server"><asp:ListItem Text="--Seleccionar--" Value="0"></asp:ListItem></asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label1" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Height="53px" OnClick="Button1_Click" Text="Mostrar código del país" />
                        <br />
                        
                        <br />

                    </div>
                      
                    <br />
                    <asp:Button ID="btnInsertar" runat="server" Text="Modificar Aduana" OnClick="btnInsertar_Click" />
&nbsp;</form>
      </div>
    </div>
</asp:Content>
