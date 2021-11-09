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