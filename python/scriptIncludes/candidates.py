class caloCandidate():
    def __init__(self, entry=0, tree=None):
        if tree != None:
            self.et = tree.etVector[entry]
            self.eta = tree.etaVector[entry]
            self.mt = tree.mtVector[entry]
            self.phi = tree.phiVector[entry]
            self.pt = tree.ptVector[entry]
        else:
            self.et = 0.0
            self.eta = 0.0
            self.mt = 0.0
            self.phi = 0.0
            self.pt = 0.0
    def toList(self):
        return [
            self.pt,
            self.eta,
            self.phi,
            self.mt,
            self.et
        ]
    @staticmethod
    def new(entry=0, tree=None):
        return caloCandidate(entry=entry, tree=tree)

class caloEtSum():
    def __init__(self, entry=0, tree=None):
        if tree != None:
            self.et = tree.etVector[entry]
            self.mt = tree.mtVector[entry]
            self.pt = tree.ptVector[entry]
            self.type = tree.typeVector[entry]
        else:
            self.et = 0.0
            self.mt = 0.0
            self.pt = 0.0
            self.type = -1
    #28 different sum types
    def encodeType(self):
        theList = [0.0 for i in range(28)]
        if self.type >= 0:
            theList[self.type] = 1.0
        return theList
    def toList(self):
        return [
            self.pt,
            self.mt,
            self.et,
            *self.encodeType()
        ]
    @staticmethod
    def new(entry=0, tree=None):
        return caloEtSum(entry=entry, tree=tree)