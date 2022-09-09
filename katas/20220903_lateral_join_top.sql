SELECT categories.id AS category_id,
       categories.category,
       posts.title,
       posts.views,
       posts.id AS post_id
FROM categories
    LEFT JOIN LATERAL
    (SELECT id,
            category_id,
            title,
            views
    FROM posts
    WHERE categories.id = posts.category_id
    ORDER BY views DESC
    LIMIT 2) AS posts ON categories.id = posts.category_id
ORDER BY categories.category,
         posts.views DESC,
         post_id
;
