import datetime
import sys

if __name__ == '__main__':
    now = datetime.datetime.now()
    now.strftime('')
    sys.stdout.write(now.isoformat())
