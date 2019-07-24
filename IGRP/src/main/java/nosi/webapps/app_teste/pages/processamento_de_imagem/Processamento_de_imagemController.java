package nosi.webapps.app_teste.pages.processamento_de_imagem;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import javax.swing.*;
import javax.swing.border.*;

import com.sun.tools.internal.ws.processor.model.Model;

import java.awt.*;
import java.awt.event.*;
import java.awt.image.*;


/*----#end-code----*/
		
public class Processamento_de_imagemController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processamento_de_imagem model = new Processamento_de_imagem();
		model.load();
		Processamento_de_imagemView view = new Processamento_de_imagemView();
		/*----#start-code(index)----*/
		
		int g =Core.getParamInt("file_id");
		System.out.println("File ID:"+g);
     // Core.setMessageSuccess("link "+Core.getLinkFile(47));
		//model.setImg_1(Core.getFile(47).toString());
	//view.img_1.setValue(Core.getLinkFile(47));
      view.img_1.setValue(Core.getLinkFile(g));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionDiminuir_cont() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processamento_de_imagem model = new Processamento_de_imagem();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(diminuir_cont)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionAumentar_cont() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processamento_de_imagem model = new Processamento_de_imagem();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(aumentar_cont)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionDiminuir_bril() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processamento_de_imagem model = new Processamento_de_imagem();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(diminuir_bril)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionAumentar_bril() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processamento_de_imagem model = new Processamento_de_imagem();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(aumentar_bril)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionDiminuir_inv() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processamento_de_imagem model = new Processamento_de_imagem();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(diminuir_inv)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionAumentar_inv() throws IOException, IllegalArgumentException, IllegalAccessException{
		Processamento_de_imagem model = new Processamento_de_imagem();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(aumentar_inv)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	public class TRescaleOp extends JFrame {
	    DisplayPanel displayPanel;
	    JButton brightenButton, darkenButton,
	            contIncButton, contDecButton;
	    
	    public TRescaleOp() {
	        super();
	        Container container = getContentPane();

	        displayPanel = new DisplayPanel();
	        container.add(displayPanel);

	        JPanel panel = new JPanel();
	        panel.setLayout(new GridLayout(2, 2));
	        panel.setBorder(new TitledBorder(
	            "Click a Button to Perform the Associated Operation..."));

	        brightenButton = new JButton();
	        brightenButton.addActionListener(new ButtonListener());
	        darkenButton = new JButton("Brightness <<");
	        darkenButton.addActionListener(new ButtonListener());
 
	        contIncButton = new JButton("Contrast >>");
	        contIncButton.addActionListener(new ButtonListener());
	        contDecButton = new JButton("Contrast <<");
	        contDecButton.addActionListener(new ButtonListener());

	        panel.add(brightenButton);
	        panel.add(darkenButton);
	        panel.add(contIncButton);
	        panel.add(contDecButton);

	        container.add(BorderLayout.SOUTH, panel);

	        addWindowListener(new WindowEventHandler());
	        setSize(displayPanel.getWidth(), displayPanel.getHeight() + 10);
	        show(); // Display the frame
	    }

	    class WindowEventHandler extends WindowAdapter {
	        public void windowClosing(WindowEvent e) {
	            System.exit(0);
	        }
	    }

	    public void main(String arg[]) {
	        new TRescaleOp();
	    }

	    class ButtonListener implements ActionListener {
	        public void actionPerformed(ActionEvent e) {
	            JButton temp = (JButton) e.getSource();

	            if (temp.equals(brightenButton)) {
	                displayPanel.brighten = true;
	                displayPanel.changeOffSet();
	                System.out.println(displayPanel.offset + "=offset");
	                displayPanel.rescale();
	                displayPanel.repaint();
	            }
	            else if (temp.equals(darkenButton)) {
	                displayPanel.brighten = false;
	                displayPanel.changeOffSet();
	                System.out.println(displayPanel.offset + "=offset");
	                displayPanel.rescale();
	                displayPanel.repaint();
	            }
	            else if (temp.equals(contIncButton)) {
	                displayPanel.contrastInc = true;
	                displayPanel.changeScaleFactor();
	                System.out.println(displayPanel.scaleFactor + "=scaleF");
	                displayPanel.rescale();
	                displayPanel.repaint();
	            }
	            else if (temp.equals(contDecButton)) {
	                displayPanel.contrastInc = false;
	                displayPanel.changeScaleFactor();
	                System.out.println(displayPanel.scaleFactor + "=scaleF");
	                displayPanel.rescale();
	                displayPanel.repaint();
	            }
	        }
	    }
	}
	class DisplayPanel extends JPanel {
	    Image displayImage;
	    BufferedImage biSrc, biDest, bi; 
	    Graphics2D big;
	    RescaleOp rescale;
	    float scaleFactor = 1.0f;
	    float offset = 10;
	    boolean brighten, contrastInc;

	    DisplayPanel() {
	        setBackground(Color.black); 
	        loadImage();
	        setSize(displayImage.getWidth(this),
	                displayImage.getWidth(this));
	        createBufferedImages();
	    }

	    public void loadImage() {
	        displayImage = Toolkit.getDefaultToolkit().getImage("largeJava2sLogo.jpg");
	        MediaTracker mt = new MediaTracker(this);
	        mt.addImage(displayImage, 1);
	        try {
	            mt.waitForAll();
	        } catch (Exception e) {
	            System.out.println("Exception while loading.");
	        }
	 
	        if (displayImage.getWidth(this) == -1) {
	            System.out.println("No jpg file");
	            System.exit(0);
	        }
	    }

	    public void createBufferedImages() {
	        biSrc = new BufferedImage(displayImage.getWidth(this),
	                                  displayImage.getHeight(this),
	                                  BufferedImage.TYPE_INT_RGB);

	        big = biSrc.createGraphics();
	        big.drawImage(displayImage, 0, 0, this);

	        biDest = new BufferedImage(displayImage.getWidth(this),
	                                   displayImage.getHeight(this),
	                                   BufferedImage.TYPE_INT_RGB);
	        bi = biSrc;
	    }

	    public void changeOffSet() {
	        if (brighten) {
	            if (offset < 255)
	               offset = offset+5.0f;
	        }
	        else {
	            if (offset > 0)
	               offset = offset-5.0f;
	        }
	    }

	    public void changeScaleFactor() {
	        if (contrastInc) {
	            if (scaleFactor < 2)
	                scaleFactor = scaleFactor+0.1f;
	        }
	        else {
	            if (scaleFactor > 0)
	                scaleFactor = scaleFactor-0.1f;
	        }
	    }

	    public void rescale() {
	        rescale = new RescaleOp(scaleFactor, offset, null);
	        rescale.filter(biSrc, biDest);
	        bi = biDest;
	    }

	    public void update(Graphics g) {
	        g.clearRect(0, 0, getWidth(), getHeight());
	        paintComponent(g);
	    }

	    public void paintComponent(Graphics g) {
	        super.paintComponent(g);
	        Graphics2D g2D = (Graphics2D) g;

	        g2D.drawImage(bi, 0, 0, this);
	    }
	}


	           

/*----#end-code----*/
}
