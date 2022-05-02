package com.example.augolf.services;

import com.example.augolf.model.AccountRoleModel;
import com.example.augolf.model.AccountStatusModel;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class ReadXML {

    ArrayList<AccountRoleModel> arm = new ArrayList<>();
    ArrayList<AccountStatusModel> asm = new ArrayList<>();

    public ArrayList<AccountRoleModel> getArm(){
        return arm;
    }

    public ArrayList<AccountStatusModel> getAsm(){
        return asm;
    }

    public void readFile(String fileName) {
        if (fileName != "accountRoleLookup.xml" && fileName != "accountStatusLookup.xml"){
            //This would be an excellent logging for whenever someone tried to read custom files to load
            return;
        }
        String nodeParent = "";
        if (fileName == "accountStatusLookup.xml"){
            nodeParent = "Status";
        }
        else{
            nodeParent = "Role";
        }

        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();

            Document doc = db.parse(ReadXML.class.getClassLoader().getResourceAsStream(fileName));
            doc.getDocumentElement().normalize();
            NodeList nList = doc.getElementsByTagName(nodeParent);
            int lengthOfNList = nList.getLength();
            for (int index = 0; index < lengthOfNList; index++) {
                Node nNode = nList.item(index);
                Element temp = (Element) nNode;
                int tempID = Integer.parseInt(temp.getElementsByTagName("ID").item(0).getTextContent());
                String tempName = temp.getElementsByTagName("Name").item(0).getTextContent();
                if (fileName == "accountStatusLookup.xml"){
                    asm.add(new AccountStatusModel(tempID, tempName));
                }
                else{
                    arm.add(new AccountRoleModel(tempID, tempName));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("File Not Found.");
        }
    }
}
