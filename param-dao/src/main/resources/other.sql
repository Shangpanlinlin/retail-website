alter table item_catagory add CONSTRAINT FK_catagory  FOREIGN KEY (catagoryId)
REFERENCES catagory(catagoryId) ON DELETE RESTRICT on UPDATE RESTRICT;

alter table item_catagory ADD CONSTRAINT FK_item FOREIGN KEY (itemId) REFERENCES
item(id) on DELETE RESTRICT on UPDATE RESTRICT;