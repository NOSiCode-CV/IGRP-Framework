package nosi.teste;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPVerticalMenu;

public class MainTest {
	
	public static void main(String[] args){
		IGRPVerticalMenu vm = new IGRPVerticalMenu("verticalmenu_1");
		IGRPButton button = new IGRPButton();
		button.setApp("marcao_consulta");
		button.setImg("default|fa-angle-right");
		button.setLink("index");
		button.setPage("ConsultaPendente");
		button.setTarget("_self");
		button.setTitle("Button");
		vm.addButton(button);
		
		System.out.println(vm);
	}

}
