create table source.p4_resident_clinics
(
    p4_resident_id integer not NULL,
    p4_clinic_id varchar not NULL,
    first_year integer,
    last_year integer,
    CONSTRAINT resident_exists FOREIGN KEY (p4_resident_id)
        REFERENCES source.p4_residents (id),
    CONSTRAINT clinic_exists FOREIGN KEY (p4_clinic_id)
        REFERENCES source.p4_clinics (p4_clinic_id)
);

