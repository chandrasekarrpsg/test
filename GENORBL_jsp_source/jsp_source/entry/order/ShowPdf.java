/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Order;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author debasis saha
 */
public class ShowPdf extends HttpServlet {
   
    public String ShowPdf(HttpServletRequest req, HttpServletResponse res, String sDirNm , String sFlNm) throws IOException {

        /*String fileOne = "/app5/misc/LCMS/lcms_server_project/lcms_server_project/reports/case2011-0001_01.pdf";
        String fileTwo = "/app5/misc/LCMS/lcms_server_project/lcms_server_project/reports/case2011-0001_02.pdf";
        String mergedFileLocation = "/app5/misc/LCMS/lcms_server_project/lcms_server_project/reports/case2011-0001.pdf";

        String filesTobeMerges[] = new String[] { fileOne, fileTwo };*/

        res.setContentType("application/pdf");

        res.setHeader("Content-disposition", "inline; filename=" + sFlNm + ".pdf");


        ByteArrayOutputStream baos = getByteArrayOutputStream(sFlNm, sDirNm);

        res.setContentLength(baos.size());

        ServletOutputStream sos;

        sos = res.getOutputStream();

        baos.writeTo(sos);

        sos.flush();

        return null;
    }

    private ByteArrayOutputStream getByteArrayOutputStream(String sFlNm, String sDirNm) throws IOException {

        //String filePath = "/app5/misc/LCMS/lcms_server_project/lcms_server_project/reports/";

        String folderPath = sDirNm + sFlNm;

        File file = new File(folderPath);

        FileInputStream fis = new FileInputStream(file);

        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] buf = new byte[256];
        try {
            for (int readNum; (readNum = fis.read(buf)) != -1;) {
                bos.write(buf, 0, readNum); //no doubt here is 0
                //Writes len bytes from the specified byte array starting at offset off to this byte array output stream.
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return bos;
    }



    public void processRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String sFlNm = req.getParameter("sFlNm");
        String sIpAddr = req.getParameter("sIpAddr");
        String sOrdId = req.getParameter("sOrdId");


        if (sOrdId.equals("")) {
            sFlNm = sIpAddr + "_" + sFlNm;
        } else {
            sFlNm = sOrdId + "_" + sFlNm;
        }

        String sDirNm = "D:\\My Documents\\Projects\\GENORBL\\UpldAnnexPdf\\";

        ShowPdf(req, res, sDirNm,sFlNm);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
