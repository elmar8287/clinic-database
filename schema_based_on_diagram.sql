CREATE TABLE patients (
  id BIGSERIAL PRIMARY KEY,
  patient_name VARCHAR(150)
);

CREATE TABLE invoices (
  id BIGSERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(medical_history_id)
);

CREATE TABLE medical_histories (
  id BIGSERIAL PRIMARY KEY,
  addmited_at TIMESTAMP,
  patient_id INT,
  status VARCHAR
);

CREATE TABLE invoice_items (
  id BIGSERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY(invoice_id) REFERENCES invoices(invoice_id),
  FOREIGN KEY(treatment_id) REFERENCES treatments(treatment_id)
);

CREATE TABLE treatments (
  id BIGSERIAL PRIMARY KEY,
  type VARCHAR,
  name VARCHAR
);