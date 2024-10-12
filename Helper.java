package com.ecommerce.helper;

public class Helper {

    public static String get10Words(String desc) {
        // Split the description into words
        String[] words = desc.split("\\s+"); // use regex \\s+ to handle multiple spaces
        
        // Check if the number of words is more than 10
        if (words.length > 10) {
            // Use StringBuilder for better performance with string concatenations
            StringBuilder truncatedDesc = new StringBuilder();
            for (int i = 0; i < 10; i++) {
                truncatedDesc.append(words[i]).append(" ");
            }
            return truncatedDesc.toString().trim() + "..."; // Trim to remove trailing space and append "..."
        } else {
            return desc + "...";
        }
    }

}
