CREATE TABLE patients (
  id BIGSERIAL PRIMARY KEY,
  patient_name VARCHAR(150),
  date_of_birth DATE
);

CREATE TABLE medical_histories (
  id BIGSERIAL PRIMARY KEY,
  addmited_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices (
  id BIGSERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT,
  FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id BIGSERIAL PRIMARY KEY,
  type VARCHAR,
  name VARCHAR
);

CREATE TABLE invoice_items (
  id BIGSERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  treatment_id INT,
  FOREIGN KEY(invoice_id) REFERENCES invoices(id),
  FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);

CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON invoice_items (invoice_id);
