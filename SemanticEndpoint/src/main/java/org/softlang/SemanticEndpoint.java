package org.softlang;

import com.google.gson.Gson;
import org.softlang.gremlin101.Explorer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.ParseException;
import java.util.List;

@WebServlet(name = "SemanticEndpoint")
public class SemanticEndpoint extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //TODO: POST json data is not supported at the moment
        /*
        PrintWriter writer = response.getWriter();
        StringBuffer jb = new StringBuffer();
        String line = null;
        try {
            BufferedReader reader = request.getReader();
            while ((line = reader.readLine()) != null)
                jb.append(line);
        } catch (Exception e) {

        }

        Gson gson = new Gson();
        Message m = gson.fromJson(jb.toString(), Message.class);
        response.setContentType("application/json");

        List<String> params = m.getParams();

        if (m.getMethod() == "getResourceTriples"){
            writer.println("getResourceTriples");
            String res = Explorer.getResourceTriples("Language-3AHaskell");
            writer.write(res);
        }

        writer.close();

        */

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String method = request.getParameter("method");
       String resource = request.getParameter("resource");
       handle(method, resource, response);
    }

    private void handle(String method, String resource, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        response.addHeader("Access-Control-Allow-Origin","*");
        if(method.equalsIgnoreCase("getResourceTriples"))   {
            if(!resource.isEmpty()) {
                String res = Explorer.getResourceTriples(resource);
                response.setContentType("application/json");
                writer.write("callback("+res+")");
                writer.close();
            }
        }
    }
}
