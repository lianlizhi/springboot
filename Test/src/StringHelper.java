import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public class StringHelper {
	public static boolean isNullOrEmpty(String str) {
		return (str == null) || (str.isEmpty()) || ("null".equalsIgnoreCase(str.trim()));
	}

	public static boolean isNotEmpty(String str) {
		return !isNullOrEmpty(str);
	}

	public static boolean isNullOrEmpty(Object obj) {
		return !isNotEmpty(obj);
	}

	public static boolean isNotEmpty(Object obj) {
		return (obj != null) && (!isNullOrEmpty(String.valueOf(obj)));
	}

	public static boolean isContantsGBK(String strGBK) {
		if (isNullOrEmpty(strGBK))
			return false;
		int count = 0;
		String regEx = "[\\u4e00-\\u9fa5]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(strGBK);
		while (m.find()) {
			for (int i = 0; i <= m.groupCount(); i++) {
				count += 1;
			}
		}
		if (count > 0) {
			return true;
		}
		return false;
	}

	public static boolean isNumeric(String str) {
		if (isNullOrEmpty(str)) {
			return false;
		}
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	public static boolean isFloat(String str) {
		if (isNullOrEmpty(str)) {
			return false;
		}
		Pattern pattern = Pattern.compile("([0-9]+)|([0-9]+\\.[0-9]+)");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	public static boolean isGBK(String str) {
		if (isNullOrEmpty(str)) {
			return false;
		}
		Pattern pattern = Pattern.compile("[\\u4e00-\\u9fa5]");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	public static int finder(String source, String regexNew) {
		String regex = "[a-zA-Z]+";
		if ((regexNew != null) && (!regexNew.equals(""))) {
			regex = regexNew;
		}
		Pattern expression = Pattern.compile(regex);
		Matcher matcher = expression.matcher(source);
		TreeMap myTreeMap = new TreeMap();
		int n = 0;
		Object word = null;
		Object num = null;
		while (matcher.find()) {
			word = matcher.group();
			n++;
			if (myTreeMap.containsKey(word)) {
				num = myTreeMap.get(word);
				Integer count = (Integer) num;
				myTreeMap.put(word, new Integer(count.intValue() + 1));
			} else {
				myTreeMap.put(word, new Integer(1));
			}
		}
		return n;
	}

	public static String padNumberLeft(int value, int length) {
		return String.format(new StringBuilder().append("%0").append(length).append("d").toString(),
				new Object[] { Integer.valueOf(value) });
	}

	public static String StringPadLeft(String source, char padChar, int length) {
		if (source.length() >= length)
			return source;
		String result = source;
		while (result.length() < length) {
			result = new StringBuilder().append(padChar).append(result).toString();
		}
		return result;
	}

	public static String StringPadRight(String source, char padChar, int length) {
		if (source.length() >= length)
			return source;
		String result = source;
		while (result.length() < length) {
			result = new StringBuilder().append(result).append(padChar).toString();
		}
		return result;
	}

	public static String[] splitByTokenizer(String s, String spliter) {
		StringTokenizer strToken = new StringTokenizer(s, spliter, false);
		StringTokenizer childToken = null;
		int tokenNum = strToken.countTokens();
		String[] sa = new String[tokenNum];
		int i = 0;
		while (strToken.hasMoreTokens()) {
			childToken = new StringTokenizer(strToken.nextToken());
			try {
				sa[i] = childToken.nextToken();
			} catch (NoSuchElementException ex) {
				sa[i] = "";
			}
			i++;
		}

		return sa;
	}

	public static String generateFillZeroString(int value, int len) {
		String strValue = String.valueOf(value);
		while (strValue.length() < len)
			strValue = new StringBuilder().append("0").append(strValue).toString();
		return strValue;
	}

	public static String generateFillZeroString(String value, int len) {
		String strValue = value;
		while (strValue.length() < len)
			strValue = new StringBuilder().append("0").append(strValue).toString();
		return strValue;
	}

	public static String generateFillStringBehind(String value, int len, String fillChar) {
		StringBuilder sb = new StringBuilder(value);
		while (sb.length() < len)
			sb.append(fillChar);
		return sb.toString();
	}

	public static String conactByString(String ori, String spliter) {
		if (isNullOrEmpty(ori))
			return null;
		int len = ori.length();
		StringBuilder sb = new StringBuilder(len * 2 - 1);
		boolean first = true;
		for (int i = 0; i < len; i++) {
			if (first)
				first = false;
			else
				sb.append(spliter);
			sb.append(ori.charAt(i));
		}
		return sb.toString();
	}

	public static String getPlateFtrQueryCondition(String plate) {
		plate = plate.trim();
		boolean anywhere = false;
		if (plate.indexOf(" ") != -1) {
			anywhere = true;
		}

		StringBuilder sb = new StringBuilder();
		boolean first = true;
		if (anywhere) {
			String[] arrPlate = splitExcludeEmpty(plate, " ");
			for (String item : arrPlate)
				if (!isNullOrEmpty(item.trim())) {
					if (first)
						first = false;
					else {
						sb.append(" AND ");
					}
					String tmpStr = item.trim();
					if (tmpStr.length() > 1)
						sb.append(conactByString(tmpStr, " "));
					else
						sb.append(tmpStr);
				}
		} else {
			int len = plate.length();
			for (int i = 0; i < len; i++) {
				if (first)
					first = false;
				else
					sb.append(" ");
				sb.append(plate.charAt(i));
			}
		}
		return sb.toString();
	}

	public static String[] split(String s, String spliter) {
		List v = new ArrayList();
		String temp = s;
		if ((s == null) || (s.trim().equals(""))) {
			return new String[0];
		}
		int len = spliter.length();
		int index;
		while ((index = temp.indexOf(spliter)) != -1) {
			String val = temp.substring(0, index);
			v.add(val);
			temp = temp.substring(index + len);
		}
		v.add(temp);
		String[] rs = new String[v.size()];
		for (int i = 0; i < v.size(); i++) {
			rs[i] = ((String) v.get(i));
		}
		return rs;
	}

	public static String[] splitExcludeEmpty(String s, String spliter) {
		List v = new ArrayList();
		String temp = s;
		if ((s == null) || (s.trim().equals(""))) {
			return new String[0];
		}
		int len = spliter.length();
		int index;
		while ((index = temp.indexOf(spliter)) != -1) {
			String val = temp.substring(0, index);
			if (isNotEmpty(val))
				v.add(val);
			temp = temp.substring(index + len);
		}
		if (isNotEmpty(temp))
			v.add(temp);
		String[] rs = new String[v.size()];
		for (int i = 0; i < v.size(); i++) {
			rs[i] = ((String) v.get(i));
		}
		return rs;
	}

	public static List<String> splitExcludeEmptyToList(String s, String spliter) {
		List v = new ArrayList();
		String temp = s;
		if ((s == null) || (s.trim().equals(""))) {
			return v;
		}
		int len = spliter.length();
		int index;
		while ((index = temp.indexOf(spliter)) != -1) {
			String val = temp.substring(0, index);
			if (isNotEmpty(val))
				v.add(val);
			temp = temp.substring(index + len);
		}
		if (isNotEmpty(temp))
			v.add(temp);
		return v;
	}

	public static List<Long> splitExcludeEmptyToLongList(String s, String spliter) {
		List v = new ArrayList();
		String temp = s;
		if ((s == null) || (s.trim().equals(""))) {
			return v;
		}
		int len = spliter.length();
		int index;
		while ((index = temp.indexOf(spliter)) != -1) {
			String val = temp.substring(0, index).trim();
			if (isNotEmpty(val))
				v.add(Long.valueOf(val));
			temp = temp.substring(index + len);
		}
		if (isNotEmpty(temp)) {
			v.add(Long.valueOf(temp));
		}
		return v;
	}

	public static List<Integer> splitExcludeEmptyToIntegerList(String s, String spliter) {
		List v = new ArrayList();
		String temp = s;
		if ((s == null) || (s.trim().equals(""))) {
			return v;
		}
		int len = spliter.length();
		int index;
		while ((index = temp.indexOf(spliter)) != -1) {
			String val = temp.substring(0, index).trim();
			if (isNotEmpty(val))
				v.add(Integer.valueOf(val));
			temp = temp.substring(index + len);
		}
		if (isNotEmpty(temp)) {
			v.add(Integer.valueOf(temp));
		}
		return v;
	}

	public static List<String> getListExcludeEmpty(String s, String spliter) {
		List v = new ArrayList();
		String temp = s;
		if ((s == null) || (s.trim().equals(""))) {
			return v;
		}
		int len = spliter.length();
		int index;
		while ((index = temp.indexOf(spliter)) != -1) {
			String val = temp.substring(0, index);
			if (isNotEmpty(val))
				v.add(val);
			temp = temp.substring(index + len);
		}
		if (isNotEmpty(temp))
			v.add(temp);
		return v;
	}

	public static String replace(String s, String tobeReplaced, String replacer) {
		String right = "";
		StringBuffer sr = new StringBuffer("");
		int index = -1;
		String sb = tobeReplaced;
		String st = replacer;

		if ((s == "") || (sb == "")) {
			return s;
		}
		right = s;

		while ((index = right.indexOf(sb)) != -1) {
			sr.append(right.substring(0, index)).append(st);
			right = right.substring(index + sb.length());
		}
		return sr.append(right).toString();
	}

	public static String formatScript(String script) {
		script = replace(script, "\n", "");
		script = replace(script, "\r", "");
		script = replace(script, "'", "\\'");
		return script;
	}

	public static String formatMmsContent(String content) {
		content = replace(content, "?", "%3F");
		content = replace(content, "\"", "%22");
		content = replace(content, "<", "%3C");
		content = replace(content, ">", "%3E");
		content = replace(content, "&", "%26");
		content = replace(content, "+", "%2B");
		content = replace(content, "#", "%23");
		content = replace(content, "%", "%25");
		content = replace(content, "*", "%2A");
		content = replace(content, "！", "%21");
		content = replace(content, "'", "%27");
		content = replace(content, "\\", "%5C");
		content = replace(content, "=", "%3D");
		content = replace(content, "\n", "%0D%0A");
		content = replace(content, " ", "%20");
		return content;
	}

	public static boolean matchingParameter(Map parameterMap, String parameters) {
		boolean matching = true;
		while (parameters.startsWith("?"))
			parameters = parameters.substring(1);
		String[] paramPair = splitByTokenizer(parameters, "&");
		int len = paramPair.length;
		for (int i = 0; i < len; i++) {
			if (!paramPair[i].trim().equals("")) {
				String[] paramNameVal = splitByTokenizer(paramPair[i].trim(), "=");
				int len2 = paramNameVal.length;

				if (len2 == 2) {
					if (parameterMap.containsKey(paramNameVal[0].trim())) {
						if (!isNullOrEmpty(paramNameVal[1])) {
							String[] currentVals = (String[]) parameterMap.get(paramNameVal[0].trim());
							int len3 = currentVals.length;
							boolean contains = false;

							if (len3 > 0) {
								if (currentVals[0].trim().equals(paramNameVal[1].trim())) {
									contains = true;
								}

							}

							if (!contains) {
								matching = false;
								break;
							}
						}
					} else {
						matching = false;
						break;
					}
				}
			}
		}
		return matching;
	}

	public static Map getParameterMap(String parameters) {
		Map paramsMap = new HashMap();
		if (isNullOrEmpty(parameters))
			return paramsMap;
		while (parameters.startsWith("?"))
			parameters = parameters.substring(1);
		String[] paramPair = splitByTokenizer(parameters, "&");

		int len = paramPair.length;
		for (int i = 0; i < len; i++) {
			String strParamPair = paramPair[i].trim();
			if (!strParamPair.equals("")) {
				String[] paramNameVal = splitByTokenizer(strParamPair, "=");
				int len2 = paramNameVal.length;
				if (len2 == 2)
					paramsMap.put(paramNameVal[0].trim(), new String[] { paramNameVal[1].trim() });
			}
		}
		return paramsMap;
	}

	public static String getParameterString(Map paramMap) {
		StringBuffer paramStr = new StringBuffer();
		Iterator keyIterator = paramMap.keySet().iterator();
		boolean first = true;
		while (keyIterator.hasNext()) {
			String key = keyIterator.next().toString();
			String[] values = (String[]) paramMap.get(key);
			int len = values.length;
			for (int i = 0; i < len; i++)
				if (!isNullOrEmpty(values[i])) {
					if (first) {
						paramStr.append("?").append(key).append("=").append(values[i]);
						first = false;
					} else {
						paramStr.append("&").append(key).append("=").append(values[i]);
					}
				}
		}
		String params = paramStr.toString();
		return params;
	}

	public static boolean getBoolean(String strBool) {
		if (isNullOrEmpty(strBool))
			return false;
		String tmpBool = strBool.trim().toUpperCase();
		if (("Y".equals(tmpBool)) || ("TRUE".equals(tmpBool)) || ("YES".equals(tmpBool)) || ("T".equals(tmpBool))
				|| ("ON".equals(tmpBool))) {
			return true;
		}
		return false;
	}

	public static String getTableFieldName(String property) {
		StringBuilder result = new StringBuilder();
		result.append(property.charAt(0));
		int len = property.length();
		for (int i = 1; i < len; i++) {
			if (Character.isUpperCase(property.charAt(i))) {
				result.append("_");
			}
			result.append(property.charAt(i));
		}
		return result.toString().toUpperCase();
	}

	public static String getPropertyString(String tmpStr) {
		if (isNullOrEmpty(tmpStr))
			return null;
		StringBuffer result = new StringBuffer();
		String[] arr = tmpStr.toLowerCase().split("[_]");
		int len = arr.length;
		result.append(arr[0].toLowerCase());
		for (int i = 1; i < len; i++) {
			result.append(String.valueOf(arr[i].charAt(0)).toUpperCase()).append(arr[i].substring(1));
		}
		return result.toString();
	}

	public static String getPropertyDescString(String tmpStr) {
		if (isNullOrEmpty(tmpStr))
			return null;
		StringBuffer result = new StringBuffer();
		String[] arr = tmpStr.toLowerCase().split("[_]");
		int len = arr.length;

		for (int i = 0; i < len; i++) {
			if ("ID".equalsIgnoreCase(arr[i]))
				result.append("ID");
			else
				result.append(String.valueOf(arr[i].charAt(0)).toUpperCase()).append(arr[i].substring(1));
			if (i != len - 1)
				result.append(" ");
		}
		return result.toString();
	}

	public static byte[] gZip(byte[] data) {
		byte[] b = null;
		ByteArrayOutputStream bos = null;
		GZIPOutputStream gzip = null;
		try {
			bos = new ByteArrayOutputStream();
			gzip = new GZIPOutputStream(bos);
			gzip.write(data);
			gzip.finish();
			b = bos.toByteArray();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (gzip != null)
				try {
					gzip.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (bos != null)
				try {
					bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return b;
	}

	public static byte[] unGZip(byte[] data) {
		byte[] b = null;
		ByteArrayInputStream bis = null;
		GZIPInputStream gzip = null;
		ByteArrayOutputStream baos = null;
		try {
			bis = new ByteArrayInputStream(data);
			gzip = new GZIPInputStream(bis);
			baos = new ByteArrayOutputStream();
			byte[] buf = new byte[1024];
			int num = -1;

			while ((num = gzip.read(buf, 0, buf.length)) != -1) {
				baos.write(buf, 0, num);
			}
			b = baos.toByteArray();
			baos.flush();
			baos.close();
			gzip.close();
			bis.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (baos != null)
				try {
					baos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (gzip != null)
				try {
					gzip.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (bis != null)
				try {
					bis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return b;
	}

	public static String getExceptionStackTrace(Throwable exception) {
		String exceStackTrace = null;
		if (exception != null) {
			StringWriter swriter = null;
			PrintWriter pwriter = null;
			try {
				swriter = new StringWriter();
				pwriter = new PrintWriter(swriter);
				exception.printStackTrace(pwriter);
				exceStackTrace = swriter.toString();
			} finally {
				if (swriter != null)
					try {
						swriter.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				if (pwriter != null) {
					try {
						pwriter.close();
					} catch (Exception e) {
						e.printStackTrace();    
					}
				}
			}
		}
		return exceStackTrace;
	}

	public static void main(String[] args) {
		String ori = " , ,   ";
		String[] arr = splitExcludeEmpty(ori, ",");
		System.out.println(new StringBuilder().append("len=").append(arr.length).toString());
		for (int i = 0; i < arr.length; i++)
			System.out.println(new StringBuilder().append(i).append("=").append(arr[i]).toString());
	}
}