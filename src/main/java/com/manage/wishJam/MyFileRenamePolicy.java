package com.manage.wishJam;

import java.io.*;  
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {  
    private String userId;	// 사용자 ID

    // 생성자 또는 설정 메서드를 통해 userId를 설정
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
        System.out.println(ext);
        String newName = userId + ".jpg";	//뭔 이미지파일올려도 jpg로 세팅하는걸로 합니다~~
        File newFile = new File(f.getParent(), newName);

        //덮어쓰기
        if (newFile.exists()) {
            return newFile;
        }

        return new File(f.getParent(), newName);
    }
}
