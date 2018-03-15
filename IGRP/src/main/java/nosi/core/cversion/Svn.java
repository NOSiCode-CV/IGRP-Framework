package nosi.core.cversion;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Iekiny Marcel
 * Mar 14, 2018
 */
public final class Svn {
	
	private String svnUrl;
    private String localUriPath;
    private String workFolder;
    private String message;
    
    private String error;
    private boolean isSuccess;
    
    private String cmd; //  the current executed command 
    private String cmdResult; // store the result of an executed command 

    public Svn() { // load default values ...
    	this.svnUrl = "https://subversion.gov.cv:18080/svn/FrontIGRP/trunk/";
        this.localUriPath = "C:\\Users\\angelo.correia.GOVCV\\";
        this.message = "";
        this.isSuccess = false;
        this.cmd = "";
        this.cmdResult = "";
    }
    
    public Svn(String svnUrl, String localUriPath, String workFolder) {
		this();
		this.svnUrl = svnUrl;
		this.localUriPath = localUriPath;
		this.workFolder = workFolder;
	}

	private boolean exec () {
    	try {
    		final Process p = Runtime.getRuntime().exec(this.cmd);
            new Thread(new Runnable() {
                public void run() {
                    BufferedReader input = new BufferedReader(new InputStreamReader(p.getInputStream()));
                    String line = "";
                    try {
                        while ((line = input.readLine()) != null) {
                        	cmdResult += line;
                            System.out.println(line);
                        }
                        isSuccess = true;
                    } catch (IOException e) {
                        e.printStackTrace();
                        isSuccess = false;
                        error = e.getMessage();
                    }
                }
            }).start();
            p.waitFor();
            isSuccess = true;
    	}catch(IOException | InterruptedException e) {
    		e.printStackTrace();
    		isSuccess = false;
    		error = e.getMessage();
    	}
    	return isSuccess;
    }

    public boolean mkdir() throws IOException, InterruptedException {
    	this.cmd = "svn mkdir " + getSvnUrl() + getWorkFolder() + " -m \"" + this.message + "\"";
    	return exec();
    }

    public boolean co() throws IOException, InterruptedException {
    	this.cmd = "svn co " + getSvnUrl() + getWorkFolder();
    	return exec();
    }
    
    public boolean add(String file_dir) {
    	this.cmd = "svn add " + getLocalUri();
    	return exec();
    }

    public boolean update()  {
    	this.cmd = "svn update " + getLocalUri();
    	return exec();
    }

    public boolean commit()  {
    	this.cmd = "svn commit " + getLocalUri() + " -m \"" + getMessage() + "\"";
    	return exec();
    }
    
    public String getSvnUrl() {
		return svnUrl;
	}

	public Svn setSvnUrl(String svnUrl) {
		this.svnUrl = svnUrl;
		return this;
	}

	public String getLocalUriPath() {
		return localUriPath;
	}

	public Svn setLocalUriPath(String localUriPath) {
		this.localUriPath = localUriPath;
		return this;
	}

	public String getWorkFolder() {
		return workFolder;
	}

	public Svn setWorkFolder(String workFolder) {
		this.workFolder = workFolder;
		return this;
	}

	public String getMessage() {
		return message;
	}

	public Svn setMessage(String message) {
		this.message = message;
		return this;
	}

	public  String getLocalUri() {
          return localUriPath + workFolder;
    }

    public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getCmd() {
		return cmd;
	}
	
	public String getCmdResult() {
		return cmdResult;
	}
	
	public static void main(String[] args) throws InterruptedException, IOException {
         /* Svn  svnapi = new Svn();
          // faz o set da Pasta de trabalho
          svnapi.setWork_folder("cubaia");
          // define o comentário para a as operações com comentários
          svnapi.setMessage("pasta de teste");
          // cria a pasta no svn, caso existir, td bem!
          svn_mkdir();
          svnapi.setMessage(null);
          // faz o checkout do projecto, caso  existir td bem!
          svn_co();
          // adciona a pasta
          svn_add(getLocal_url());
          svnapi.setMessage("pasta de teste");
          // faz o commit
          svn_commit();
          svnapi.setMessage(null);
          // faz o update, sincronização com local
          svn_update();*/
    }
    

}
