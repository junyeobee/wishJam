package com.manage.wishJam;

import java.io.*;  
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {  
    private String userId;

    //userId는 session등에서 받아오는 걸 인자로 넣어주시면 됩니다.
    public MyFileRenamePolicy(String userId) {
        this.userId = userId;
    }
    //파일이름변경로직
    public File rename(File f) {
        String name = f.getName();
        String ext = null;

        int dot = name.lastIndexOf(".");  
        if (dot != -1) {  
            ext = name.substring(dot);//확장자 분리(.(jpg,png,...)근데 이거 안써요)
        } else {  
            ext = "";  
        }  

        //인자의 userId를 이미지파일의 값으로 세팅
        String newName = userId + ".jpg";	//뭔 이미지파일올려도 jpg로 세팅하는걸로 합니다~~
        File newFile = new File(f.getParent(), newName);

        //덮어쓰기
        if (newFile.exists()) {
            return newFile;
        }

        return new File(f.getParent(), newName);
    }
}
