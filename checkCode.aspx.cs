using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class admin_checkCode : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string checkCode = CreateRandomCode(4);
        Session["CheckCode"] = checkCode;
        CreateImage(checkCode);
    }

    /// <summary>
    /// ���������
    /// </summary>
    /// <param name="num">��������</param>
    /// <returns>���������</returns>
    public string CreateRandomCode(int num)
    {
        string[] source ={ "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
        string code = "";
        Random rd = new Random();
        for (int i = 0; i < num; i++)
        {
            code += source[rd.Next(0, source.Length)];//��0��source���鳤�Ȳ�������±�,����source[]��ȡ
        }
        return code;
    }

    /// <summary>
    /// ����ͼƬ
    /// </summary>
    /// <param name="checkCode">�����</param>
    private void CreateImage(string checkCode)
    {
        int iwidth = (int)(checkCode.Length * 11.5);//����������趨ͼƬ���
        Bitmap image = new Bitmap(iwidth, 20);//����һ������
        Graphics g = Graphics.FromImage(image);//�ڻ����϶����ͼ��ʵ�� 
        Font f = new Font("Arial",10,FontStyle.Bold);//���壬��С����ʽ
        Brush b = new SolidBrush(Color.Black);//������ɫ
        //g.FillRectangle(new System.Drawing.SolidBrush(Color.Blue),0,0,image.Width, image.Height);
        g.Clear(Color.White);//������ɫ
        g.DrawString(checkCode, f, b, 3, 3);

        Pen blackPen = new Pen(Color.Black, 0);
        Random rand = new Random();
        /*�����
        for (int i = 0; i < 5; i++)
        {
            int y = rand.Next(image.Height);
            g.DrawLine(blackPen, 0, y, image.Width, y);
        }
        */
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        image.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
        Response.ClearContent();
        Response.ContentType = "image/Jpeg";
        Response.BinaryWrite(ms.ToArray());
        g.Dispose();
        image.Dispose();
    }
    /*
    protected void Page_Load(object sender, EventArgs e)
    {
        admin_checkCode o = new admin_checkCode();
        this.GenImg(GetCode(4));
    }

    public  string GetCode(int num)
    {
        string[] source ={ "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
        string code = "";
        Random rd = new Random();
        for (int i = 0; i < num; i++)
        {
            code += source[rd.Next(0, source.Length)];
        }
        return code;
    }

    //����ͼƬ 
    public  void GenImg(string code)
    {
        Random rd = new Random();
        Bitmap myPalette = new Bitmap(120, 60); //����һ������ 
        Graphics gh = Graphics.FromImage(myPalette); //�ڻ����϶����ͼ��ʵ�� 
        Rectangle rc = new Rectangle(0, 0, 120, 60); //����һ������ 
        String picPath = System.Web.HttpContext.Current.Server.MapPath("admin/bg" + rd.Next(1, 4).ToString().Trim() + ".jpg"); 
        Bitmap imagefile = (Bitmap)System.Drawing.Image.FromFile(picPath, true); //�õ�һ��λͼ 
        TextureBrush texture = new TextureBrush(imagefile); //��ͼƬ������ͼˢ 
        Color[] fontcolor = { Color.Black, Color.Red, Color.DarkBlue, Color.Green, Color.Red, Color.Brown, Color.DarkCyan, Color.Purple }; //���� 8 ����ɫ 
        String[] fontname = { "Verdana", "System", "Comic Sans MS", "Arial", "����" }; //���� 5 ������ 
        Font myfont; //���嶨�� 
        SolidBrush mybrush; //���ʶ��� 


        gh.FillRectangle(texture, rc);//ʹ�û�ͼˢ�����Σ����˵õ�ͼƬ���� 

        for (short i = 0; i <= code.Length - 1; i++)
        {
            myfont = new Font(fontname[rd.Next(0, 5)], 30, FontStyle.Italic); //�������,42�ţ�б�� 
            mybrush = new SolidBrush(fontcolor[rd.Next(0, 8)]); //�����ɫ 
            gh.DrawString(code.Substring(i, 1), myfont, mybrush, 3 + (i * 23), rd.Next(1, 8));//�ھ����ڻ����ַ��� 
        }


        myPalette.Save(Page.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);//��ͼƬ��ʾ���� 
        Page.Session["ValidateCode"] = code;//���ַ������浽Session�У��Ա���Ҫʱ������֤ 

        gh.Dispose();
        myPalette.Dispose();
    } 
      */

}
