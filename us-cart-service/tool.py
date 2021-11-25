def db_connect(db_config):
    db_url = 'mysql+mysqlconnector://%s:%s@%s:%s/%s?charset=%s' % (
        db_config['user'],
        db_config['passwd'],
        db_config['host'],
        db_config['port'],
        db_config['db'],
        db_config['charset']
    )
    from sqlalchemy import create_engine

    engine = create_engine(db_url)

    from sqlalchemy.orm import sessionmaker

    Session = sessionmaker(bind=engine)
    session = Session()
    return session

