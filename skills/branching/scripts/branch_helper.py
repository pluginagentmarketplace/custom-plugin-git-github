#!/usr/bin/env python3
import json
def branching(): return {"strategies": ["gitflow", "trunk_based"], "commands": ["branch", "merge", "rebase"]}
if __name__ == "__main__": print(json.dumps(branching(), indent=2))
