

final createTable = '''
  CREATE TABLE contact(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,email VARCHAR(150) NOT NULL
  )
  ''';

final insert1 = '''
  INSERT INTO contact(nome, telefone, email)
  VALUES ('Bruno Lacerda','42999769320','bruno@email.com.br')
'''
;

final insert2 = '''
  INSERT INTO contact(nome, telefone, email)
  VALUES ('Juliana','15997704974','juliana@email.com.br')
'''
;

final insert3 = '''
  INSERT INTO contact(nome, telefone, email)
  VALUES ('Yan','42999987036','yan@email.com.br')
'''
;

