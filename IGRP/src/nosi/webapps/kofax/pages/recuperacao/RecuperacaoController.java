/*-------------------------*/

/*Create Controller*/

package nosi.webapps.kofax.pages.recuperacao;
/*---- Import your packages here... ----*/
import java.util.HashMap;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.swing.ImageIcon;
import nosi.core.webapp.Controller;
import java.sql.Date;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;
import nosi.core.xml.XMLWritter;
import nosi.webapps.kofax.dao.Campos;
import nosi.webapps.kofax.dao.Dados;
import nosi.webapps.kofax.dao.Objeto;
import nosi.core.webapp.helpers.DateHelper;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Permission;
/*---- End ----*/

public class RecuperacaoController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/										
		Recuperacao model = new Recuperacao();
		RecuperacaoView view = new RecuperacaoView(model);
		
		view.tipo_objeto.setValue(IgrpHelper.toMap(new Objeto().find().andWhere("id_organica", "=", Permission.getCurrentOrganization()).all(), "id", "objeto"));
		HashMap<Integer,String> td = new HashMap<>();
		td.put(1, "Passaporte");
		td.put(2, "Livro");
		view.tipo_documento.setValue(td);
		view.campo.setValue(IgrpHelper.toMap(new Campos().find().andWhere("estado", "=", "ATIVO").all(), "id", "campo"));
		view.data_de_registo.setValue(DateHelper.convertDate(new Date(System.currentTimeMillis()).toString(),"yyyy-MM-dd","dd-MM-yyyy"));
		return this.renderView(view);
							/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException, ServletException{
		/*---- Insert your code here... ----*/										
		Recuperacao model = new Recuperacao();
//		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
//			model.load();
//			XMLWritter xml = new XMLWritter();
//			xml.startElement("columns");
//			if(model.getP_campo_fk()!=null){
//				for(int i=0;i<model.getP_campo_fk().length;i++){
//					xml.setElement(model.getP_campo_fk_desc()[i], model.getP_valor_fk_desc()[i]);
//				}
//			}
////			File file = new File("");
//		    byte[] imgInBytes = new byte[(int) Igrp.getInstance().getRequest().getPart("p_imagem").getSize()];
//		    Igrp.getInstance().getRequest().getPart("p_imagem").getInputStream().read(imgInBytes);
////		    FileInputStream fileInputStream = new FileInputStream(file);
////		    fileInputStream.read(imgInBytes);
////		    fileInputStream.close();
//            
//			Objeto obj = new Objeto().findOne(model.getTipo_objeto());
//			Dados dados = new Dados(obj, ""+model.getN_do_negocio(), model.getN_de_processo(), model.getNome(), model.getTipo_documento(), model.getN_de_documento(), model.getEstante(), model.getPasta(), model.getLivro(), model.getFolha(), model.getData_de_registo(), xml.toString(), imgInBytes);
//			if(dados.insert()!=null){
//				Igrp.getInstance().getFlashMessage().addMessage("success", "OperaÃ§Ã£o realizada com sucesso!");
//			}else{
//				Igrp.getInstance().getFlashMessage().addMessage("error", "OperaÃ§Ã£o falhau!");
//			}
//		}
		return this.redirect("kofax","Recuperacao","index");
							/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
