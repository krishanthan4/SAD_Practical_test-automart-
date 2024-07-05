package gui;

import java.sql.ResultSet;
import java.util.Vector;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import model.DbConnection;

public class add_customer_address extends javax.swing.JDialog {

    public add_customer_address(java.awt.Frame parent, boolean modal, String mobile) {
        super(parent, modal);
        initComponents();
        jTextField3.setText(mobile);
        jTextField3.setEnabled(false);
        LoadContent();
    }

    public void LoadContent() {

        try {

            ResultSet province_rs = DbConnection.execute("SELECT * FROM `province`");
            ResultSet district_rs = DbConnection.execute("SELECT * FROM `district`");
            ResultSet city_rs = DbConnection.execute("SELECT * FROM `city`");
            jComboBox1.removeAllItems();
            jComboBox2.removeAllItems();
            jComboBox3.removeAllItems();

            Vector provincev = new Vector();
            Vector districtv = new Vector();
            Vector cityv = new Vector();
            provincev.add("Select");
            districtv.add("Select");
            cityv.add("Select");

            while (province_rs.next()) {
                provincev.add(province_rs.getString("name"));
            }

            while (district_rs.next()) {
                districtv.add(district_rs.getString("name"));
            }

            while (city_rs.next()) {
                cityv.add(city_rs.getString("name"));
            }

            jComboBox1.setModel(new DefaultComboBoxModel<>(provincev));
            jComboBox3.setModel(new DefaultComboBoxModel<>(districtv));
            jComboBox2.setModel(new DefaultComboBoxModel<>(cityv));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jComboBox1 = new javax.swing.JComboBox<>();
        jComboBox2 = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jTextField2 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jComboBox3 = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        jTextField3 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jPanel1.add(jComboBox1, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 230, 168, 39));

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jPanel1.add(jComboBox2, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 310, 168, 39));

        jLabel6.setText("City :");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 320, -1, -1));

        jLabel1.setFont(new java.awt.Font("Liberation Sans", 1, 24)); // NOI18N
        jLabel1.setText("Customer Address");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 30, -1, -1));

        jLabel2.setText("First Lane :");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 140, -1, -1));
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 130, 170, 35));
        jPanel1.add(jTextField2, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 180, 170, 35));

        jLabel3.setText("Last Lane :");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 190, -1, -1));

        jLabel4.setText("District :");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 280, -1, -1));

        jLabel5.setText("Province :");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(70, 240, -1, -1));

        jComboBox3.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));
        jPanel1.add(jComboBox3, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 270, 168, 39));

        jLabel7.setText("Customer Mobile :");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 100, -1, -1));
        jPanel1.add(jTextField3, new org.netbeans.lib.awtextra.AbsoluteConstraints(140, 90, 170, 35));

        jButton1.setText("Discard");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 390, -1, -1));

        jButton2.setText("Save");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 390, -1, -1));

        getContentPane().add(jPanel1, java.awt.BorderLayout.CENTER);

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        this.dispose();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        String line1 = jTextField1.getText();
                String line2 = jTextField2.getText();
        String mobile = jTextField3.getText();
        int province = jComboBox1.getSelectedIndex();
                int district = jComboBox2.getSelectedIndex();
        int city = jComboBox2.getSelectedIndex();


        
   try {
    ResultSet searchAddressId = DbConnection.execute("SELECT * FROM `address` WHERE `line1`='"+line1+"' AND `line2`='"+line2+"' AND `city_city_id`='"+city+"'");
  
    if (!searchAddressId.next()) {
        DbConnection.execute("INSERT INTO `address` (`line1`, `line2`, `city_city_id`) VALUES ('"+line1+"', '"+line2+"', '"+city+"')");
    }

    ResultSet getAddressId = DbConnection.execute("SELECT * FROM `address` WHERE `line1`='"+line1+"' AND `line2`='"+line2+"' AND `city_city_id`='"+city+"'");
    if (getAddressId.next()) {
        DbConnection.execute("INSERT INTO `customer_has_address` (`customer_mobile`, `address_address_id`) VALUES ('"+mobile+"', '"+getAddressId.getString("address_id")+"')");
        
        JOptionPane.showMessageDialog(rootPane, "Customer address added successfully!");
        this.dispose();
    }
} catch (Exception e) {
    e.printStackTrace();
}


    }//GEN-LAST:event_jButton2ActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private javax.swing.JComboBox<String> jComboBox3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField jTextField2;
    private javax.swing.JTextField jTextField3;
    // End of variables declaration//GEN-END:variables
}
