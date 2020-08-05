-- return count for CE since 2001Q2 and count for UG since 1/1968 (Exclude NSOR)

  SELECT sac.stc_acad_level, COUNT (DISTINCT sac.stc_person_id) rec_cnt
    FROM coll_production.student_acad_cred sac, coll_production.stc_statuses ss
   WHERE     sac.student_acad_cred_id = ss.student_acad_cred_id
         AND ss.pos = 1
         AND sac.stc_subject != 'NSOR'
         AND (   ss.stc_status IN ('A', 'N')
              OR (ss.stc_status = 'D' AND sac.stc_final_grade IS NOT NULL))
GROUP BY sac.stc_acad_level
ORDER BY sac.stc_acad_level;