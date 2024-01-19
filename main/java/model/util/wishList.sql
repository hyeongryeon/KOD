CREATE TABLE WISHLIST(
	WISHLIST_ID			INT			PRIMARY KEY,
	WISHLIST_ADDTIME	TIMESTAMP	NOT NULL,
	MEMBER_ID			VARCHAR(20) REFERENCES MEMBER(MEMBER_ID),
	PRODUCT_ID			INT			REFERENCES PRODUCT(PRODUCT_ID)
);

SELECT * FROM WISHLIST;

DROP TABLE WISHLIST;