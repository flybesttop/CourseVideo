package com.artclub.util;
import java.io.*;
import java.util.*;

/**
 * 敏感词过滤 工具类   -- 【匹配度高，可以使用】
 * 《高效精准》敏感字&词过滤：http://blog.csdn.net/hubiao_0618/article/details/45076871
 *
 * @author hubiao
 * @version 0.1
 * @CreateDate 2015年4月16日 15:28:32
 */
public class SensitiveWord {
    private StringBuilder replaceAll;//初始化
    private String encoding = "UTF-8";
    private String replceStr = "*";
    private int replceSize = 500;
    private String fileName = "E:\\CourseVideo\\src\\com\\artclub\\util\\CensorWords.txt";
    private List<String> arrayList;
    public Set<String> sensitiveWordSet;//包含的敏感词列表，过滤掉重复项
    public List<String> sensitiveWordList;//包含的敏感词列表，包括重复项，统计次数

    /**
     * 文件要求路径在src或resource下，默认文件名为E:\\Users\\Administrator\\artClub\\src\\CensorWords.txt
     *
     * @param fileName 词库文件名(含后缀)
     */
    public SensitiveWord(String fileName) {
        this.fileName = fileName;
    }

    /**
     * @param replceStr  敏感词被转换的字符
     * @param replceSize 初始转义容量
     */
    public SensitiveWord(String replceStr, int replceSize) {
        this.replceStr = fileName;
        this.replceSize = replceSize;
    }

    public SensitiveWord() {
    }

    /**
     * @param str 将要被过滤信息
     * @return 过滤后的信息
     */
    public Map filterInfo(String str) {
        StringBuilder Index = new StringBuilder();
        int status = 1;
        Map results = new HashMap();
        sensitiveWordSet = new HashSet<String>();
        sensitiveWordList = new ArrayList<>();
        StringBuilder buffer = new StringBuilder(str);
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>(arrayList.size());
        String temp;
        for (int x = 0; x < arrayList.size(); x++) {
            temp = arrayList.get(x);
            int findIndexSize = 0;
            for (int start = -1; (start = buffer.indexOf(temp, findIndexSize)) > -1; ) {
                //System.out.println("###replace="+temp);
                findIndexSize = start + temp.length();//从已找到的后面开始找
                Integer mapStart = map.get(start);//起始位置
                if (mapStart == null || (mapStart != null && findIndexSize > mapStart))//满足1个，即可更新map
                {
                    map.put(start, findIndexSize);
                    //System.out.println("###敏感词："+buffer.substring(start, findIndexSize));
                }
            }
        }
        Collection<Integer> values = map.keySet();
        for (Integer startIndex : values) {
            Integer endIndex = map.get(startIndex);
            //获取敏感词，并加入列表，用来统计数量
            String sensitive = buffer.substring(startIndex, endIndex);
            // System.out.println("###敏感词：" + sensitive);
            if (!sensitive.contains("*")) {//添加敏感词到集合
                sensitiveWordSet.add(sensitive);
                sensitiveWordList.add(sensitive);
                status = 0;
            }

            buffer.replace(startIndex, endIndex, replaceAll.substring(0, endIndex - startIndex));
            Index.append(startIndex);
            Index.append(",");
            Index.append(endIndex);
            Index.append(",");
        }
        map.clear();
        results.put("txt", str);
        results.put("result", buffer.toString());
        results.put("status", status);
        results.put("index", Index.toString());
        return results;
    }

    /**
     * 初始化敏感词库
     */
    public void InitializationWork() {
        replaceAll = new StringBuilder(replceSize);
        for (int x = 0; x < replceSize; x++) {
            replaceAll.append(replceStr);
        }
        //加载词库
        arrayList = new ArrayList<String>();
        InputStreamReader read = null;
        BufferedReader bufferedReader = null;
        try {
            read = new InputStreamReader(new FileInputStream(fileName), encoding);
            bufferedReader = new BufferedReader(read);
            for (String txt = null; (txt = bufferedReader.readLine()) != null; ) {
                if (!arrayList.contains(txt)) arrayList.add(txt);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (null != bufferedReader) bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (null != read) read.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean addSensitiveWord(String txt) throws IOException {
        boolean flag = true;
        SensitiveWord sw = new SensitiveWord("E:\\Users\\Administrator\\artClub\\src\\CensorWords.txt");
        sw.InitializationWork();//初始化
        File file = new File("E:\\Users\\Administrator\\artClub\\src\\CensorWords.txt");
        if (file.exists()) {

        } else {
            file.createNewFile();
        }

        if (!sw.arrayList.contains(txt)) {
            FileWriter writer = new FileWriter(file, true);
            BufferedWriter bf = new BufferedWriter(writer);
            bf.write(txt);
            bf.newLine();
            bf.close();
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }

    public Map CheckWord(String word) {
        SensitiveWord sw = new SensitiveWord("E:\\Users\\Administrator\\artClub\\src\\CensorWords.txt");
        sw.InitializationWork();//初始化
        return sw.filterInfo(word);//替换
    }


    public StringBuilder getReplaceAll() {
        return replaceAll;
    }

    public void setReplaceAll(StringBuilder replaceAll) {
        this.replaceAll = replaceAll;
    }

    public String getReplceStr() {
        return replceStr;
    }

    public void setReplceStr(String replceStr) {
        this.replceStr = replceStr;
    }

    public int getReplceSize() {
        return replceSize;
    }

    public void setReplceSize(int replceSize) {
        this.replceSize = replceSize;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public List<String> getArrayList() {
        return arrayList;
    }

    public void setArrayList(List<String> arrayList) {
        this.arrayList = arrayList;
    }

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

}

