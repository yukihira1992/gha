import sys
import semantic_version

if __name__ == '__main__':
    tag = sys.argv[1]
    if tag.startswith('v'):
        cur_version = tag[1:]
    else:
        cur_version = tag
    v = semantic_version.Version(cur_version)
    sys.stdout.write(str(v.next_patch()))
