package nosi.core.cversion;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.eclipse.jgit.api.Git;
import org.eclipse.jgit.api.PullCommand;
import org.eclipse.jgit.api.PullResult;
import org.eclipse.jgit.api.PushCommand;
import org.eclipse.jgit.lib.Repository;
import org.eclipse.jgit.revwalk.RevCommit;
import org.eclipse.jgit.storage.file.FileRepositoryBuilder;
import org.eclipse.jgit.transport.UsernamePasswordCredentialsProvider;

/**
 * Iekiny Marcel
 * Aug 26, 2019
 */
public class GitLab {
	
	private Git git;
	
	private String uri;
	private String dirPath;
	
	private String branchName;
	
	private String username;
	private String password;
	
	public GitLab() {
		super();
		this.branchName = "master"; 
	}
	
	 public boolean cloneRepository() {
		boolean success = true;
    	try {
    		File f = new File(this.dirPath);
    		// Clone a new local repository 
    		this.git = Git.cloneRepository().setURI(this.uri).setDirectory(f).call(); 
		} catch (Exception e) {
			e.printStackTrace(); 
			success = false;
		}
	    return success;
	}
	
	public boolean loadFromGitDir() {
		boolean success = true;
		try {
			Repository repository = new FileRepositoryBuilder().setGitDir(new File(this.dirPath + "/.git"))
	                .readEnvironment() // scan environment GIT_* variables 
	                .findGitDir() // scan up the file system tree 
	                .setMustExist(true)
	                .build();
			this.git = new Git(repository); 
		} catch (Exception e) {
			e.printStackTrace(); 
			success = false; 
		}
		return success;
	}
	
	public boolean commit(String authorName, String authorEmail, String msg) {
		boolean success = true;
		try {
			RevCommit rev = this.git.commit().setAuthor(authorName, authorEmail).setMessage(msg).call(); 
		} catch (Exception e) {
			e.printStackTrace();
			success = false; 
		}
		return success; 
	} 
	
	public boolean push() {
		boolean success = true;
		try {
			// push to remote: 
    		PushCommand pushCommand = this.git.push();
    		pushCommand.setRemote(this.uri).add(this.branchName).setForce(true);
    		pushCommand.setCredentialsProvider(new UsernamePasswordCredentialsProvider(this.username, this.password));
    		// you can add more settings here if needed 
    		pushCommand.call();
		} catch (Exception e) {
			e.printStackTrace();
			success = false; 
		}
		return success; 
	} 
	
	public boolean addToStagedChanges(File f) {
		boolean success = true;
		try {
			this.git.add().addFilepattern(f.getPath()).call(); 
		} catch (Exception e) {
			e.printStackTrace();
			success = false; 
		}
		return success; 
	}
	
	public void closeGitConnection() {
		if(this.git != null)	
			this.git.close(); 
	} 
	
	public boolean pull() {
		boolean success = true; 
		try {
			PullCommand pullCmd = this.git.pull(); 
    		PullResult result = pullCmd.call(); 
    		//FetchResult fetchResult = result.getFetchResult();
    		//MergeResult mergeResult = result.getMergeResult();
    		//MergeStatus mergeStatus = mergeResult.getMergeStatus(); 
		} catch (Exception e) {
			e.printStackTrace();
			success = false; 
		}
		return success; 
	} 
	
	public void generateGitIgnoreForJava() {
		FileWriter out = null;
		try {
			File f = new File(".gitignore"); 
			out = new FileWriter(f); 
			String content = "### Java ###" + System.lineSeparator() + 
					"# Compiled class file " + System.lineSeparator() + 
					"*.class\n\n" + 
					"### Java-Web ###" + System.lineSeparator() + 
					"## ignoring target file " + System.lineSeparator() + 
					"target/";
			out.write(content);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null)
					out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getDirPath() {
		return dirPath;
	}
	public void setDirPath(String dirPath) {
		this.dirPath = dirPath;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public Git unwrap() { 
		return this.git; 
	}
}
