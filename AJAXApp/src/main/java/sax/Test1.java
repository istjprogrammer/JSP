package sax;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class Test1 extends DefaultHandler{
	int cnt = 0;
	
	@Override
	public void startDocument() throws SAXException {
		System.out.println("문서의 시작");
	}

	@Override
	public void endDocument() throws SAXException {
		System.out.println("문서의 끝");
	}

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		System.out.println("시작 태그 : " + qName + ", " + attributes);
		
		System.out.println(attributes.getValue("age") + ", "
				+ attributes.getValue("addr"));
	}

	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		System.out.println("끝 태그 : " + qName);
	}

	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
		System.out.println("-------------------------------");
		System.out.println(cnt++);
		System.out.println(start + " : " + length);
		
		for(int i=start; i<start+length; i++) {
			System.out.print(ch[i]);
		}
		System.out.println();
		System.out.println("-------------------------------");
	}

	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {	
		SAXParserFactory factory = 
				SAXParserFactory.newInstance();
		
		SAXParser parser = factory.newSAXParser();
		
		File f = new File("C:\\netsong7\\JspWork\\EclipseWork\\AJAXApp\\src\\main\\webapp\\sax\\test.xml");
		Test1 test1 = new Test1();
		
		parser.parse(f, test1);
	}
}







