using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonTulos_Click(object sender, EventArgs e)
    {
        double eka, toka;
        double.TryParse(TextBoxEka.Text, out eka);
        double.TryParse(TextBoxToka.Text, out toka);

        Console.WriteLine(DropDownListLasku.SelectedValue);

        if (DropDownListLasku.SelectedValue.Equals("+"))
        {
            TextBoxTulos.Text += eka + " + " + toka + " = " + add(eka, toka) + "\n";
        }
        if (DropDownListLasku.SelectedValue.Equals("-"))
        {
            TextBoxTulos.Text += eka + " - " + toka + " = " + sub(eka, toka) + "\n";
        }
        if (DropDownListLasku.SelectedValue.Equals("*"))
        {
            TextBoxTulos.Text += eka + " * " + toka + " = " + mul(eka, toka) + "\n";
        }
        if (DropDownListLasku.SelectedValue.Equals("/"))
        {
            TextBoxTulos.Text += eka + " / " + toka + " = " + div(eka, toka) + "\n";
        }

        TextBoxEka.Text = "";
        TextBoxToka.Text = "";
    }

    protected double mul(double a, double b)
    {
        return a * b;
    }
    protected double div(double a, double b)
    {
        return a / b;
    }
    protected double sub(double a, double b)
    {
        return a - b;
    }
    protected double add(double a, double b)
    {
        return a + b;
    }

    protected void ButtonNollaa_Click(object sender, EventArgs e)
    {
        TextBoxTulos.Text = "";
        TextBoxEka.Text = "";
        TextBoxToka.Text = "";
    }
}