package Boletins;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class DataProcessor {
    private List<Data> dataList;

    public DataProcessor() {
        dataList = new ArrayList<>();
    }

    public List<String[]> processFileAndGetData(String filePath, String targetCode) {
        List<String[]> processedData = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            boolean targetFound = false;

            while ((line = br.readLine()) != null) {
                if (line.startsWith(targetCode)) {
                    targetFound = true;
                    processedData.add(line.split(";"));
                } else if (targetFound) {
                    // Continua lendo as linhas subsequentes até encontrar uma linha em branco
                    if (!line.trim().isEmpty()) {
                        processedData.add(line.split(";"));
                    } else {
                        break;
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return processedData;
    }

    public String getValueById(String id) {
        for (Data data : dataList) {
            if (data.getId().equals(id)) {
                return data.getValue();
            }
        }
        return null;
    }
}
