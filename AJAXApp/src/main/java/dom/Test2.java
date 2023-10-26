package dom;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.Text;
import org.xml.sax.SAXException;

public class Test2 {
	public static void main(String[] args) throws ParserConfigurationException, FileNotFoundException, SAXException, IOException, TransformerException {
		DocumentBuilderFactory factory = 
				DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = 
				builder.parse(new FileInputStream("C:\\netsong7\\JspWork\\EclipseWork\\AJAXApp\\src\\main\\webapp\\dom\\test.xml"));
		
		Element root = doc.getDocumentElement();
		
		for(Node n = root.getFirstChild(); n!=null;
				n = n.getNextSibling()) {
			if(n.getNodeName().equals("student")) {
				Element e = doc.createElement("address");
				Text t = doc.createTextNode("서울시 강남구");
				
				e.appendChild(t);
				n.appendChild(e);
			}
		}
		
		// 홍길동의 주소
		System.out.println(root.getFirstChild().
				getNextSibling().
				getLastChild().
				getTextContent());
		
		// 수정한 내용을 실제 파일에 적용
		TransformerFactory transFactory = 
				TransformerFactory.newInstance();
		Transformer trans = transFactory.newTransformer();
		
		trans.setOutputProperty(OutputKeys.ENCODING, "utf-8");
		trans.setOutputProperty(OutputKeys.INDENT, "yes");
		
		DOMSource source = new DOMSource(doc);
		StreamResult result = new StreamResult(new FileOutputStream("C:\\netsong7\\JspWork\\EclipseWork\\AJAXApp\\src\\main\\webapp\\dom\\test2.xml"));
		
		trans.transform(source, result);
	}
}








