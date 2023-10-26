package dom;
import java.io.FileInputStream;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;
import org.w3c.dom.Node;
import org.w3c.dom.Element;

public class Test1 {
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
		DocumentBuilderFactory factory = 
				DocumentBuilderFactory.newInstance();
		
		DocumentBuilder builder = factory.newDocumentBuilder();
		FileInputStream xmlFile = new FileInputStream("C:\\netsong7\\JspWork\\EclipseWork\\AJAXApp\\src\\main\\webapp\\dom\\test.xml");
		Document doc = builder.parse(xmlFile);
		
		Element root = doc.getDocumentElement();
		System.out.println(root.getNodeName());
		System.out.println(root.getNodeValue());
		System.out.println(root.getNodeType());
		
		System.out.println("-------------------------------------");
		
		Node n1 = root.getFirstChild();
		System.out.println(n1.getNodeName());
		System.out.println(n1.getNodeValue());
		System.out.println(n1.getNodeType());
		
		System.out.println("-------------------------------------");
		
		Node n2 = root.getLastChild();
		System.out.println(n2.getNodeName());
		System.out.println(n2.getNodeValue());
		System.out.println(n2.getNodeType());
		
		// 홍길동의 이름과 나이 출력
		System.out.println(n1.getFirstChild().getFirstChild().getNodeValue());
		
		xmlFile.close();
	}
}









