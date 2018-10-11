#coding=utf-8
'''
Created on 2014-12-23

@author: Devuser
'''
import unittest
from gatesidelib.githelper import GitHelper


class GitHelperTest(unittest.TestCase):


    def testclone(self):
        gitHelper=GitHelper("http://autotest:Nopass.2@github.sys.wanmei.com/git/DuShuBus.git", r"E:\CommitLog\Git\DushuBus",r"E:\CommitLog\Git\dushubus.log")
        gitHelper.clone_project()
#         
#     def testpull(self):
#         gitHelper=GitHelper("http://autotest:Nopass.2@github.sys.wanmei.com/git/DuShuBus.git", r"E:\CommitLog\Git\DushuBus",r"E:\CommitLog\Git\dushubus.log")
#         gitHelper.pull_project()
#     
#     def testsavecommitlog(self):
#         gitHelper=GitHelper("http://autotest:Nopass.2@github.sys.wanmei.com/git/DuShuBus.git", r"E:\CommitLog\Git\DushuBus",r"E:\CommitLog\Git\dushubus.log")
#         gitHelper.save_commitlog("")
    
#     def testsavecommitlog(self):
#         gitHelper=GitHelper("http://autotest:Nopass.2@github.sys.wanmei.com/git/DuShuBus.git", r"E:\CommitLog\Git\DushuBus",r"E:\CommitLog\Git\dushubus.log")
#         print(gitHelper.get_changecode_lines("6413b013c28981525b8dfe557adee862a51274aa","d274d27d251d0b77e00e68a6e856e5d4c47653c2"))
    def testspliturl(self):
        print("http://git.wanmei.com/wanmei.git".split("//"))
        


if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testcloen']
    unittest.main()