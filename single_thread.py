__author__ = 'kk'

from textblob.sentiments import NaiveBayesAnalyzer
from textblob.sentiments import PatternAnalyzer
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns # improves plot aesthetics
import timeit


def sentimentAnalysis(filename):
    # read the local txt file
    lines = [line.strip('\n') for line in open(filename)]

    # the posValue and the negValue
    pos = 0
    neg = 0

    # analyze every tweets
    for tweet in lines:
        try:
            resultBayes = analyzerBayes.analyze(tweet)
            resultPattern = analyzerPattern.analyze(tweet)
        except:
            continue

        if resultPattern[1] == 0:
            continue
        #resultPattern = [polar, sub]
        #resultBayes = [type, pos, neg]
        if resultBayes[0] == "pos":
            pos += resultBayes[1]
        else:
            neg += resultBayes[2]
    
    if pos + neg == 0:
        return -1
    
    return pos / (pos + neg) * 5.0

def _invert(x, limits):
    """inverts a value x on a scale from
    limits[0] to limits[1]"""
    return limits[1] - (x - limits[0])

def _scale_data(data, ranges):
    """scales data[1:] to ranges[0],
    inverts if the scale is reversed"""
    for d, (y1, y2) in zip(data[1:], ranges[1:]):
        assert (y1 <= d <= y2) or (y2 <= d <= y1)
    x1, x2 = ranges[0]
    d = data[0]
    if x1 > x2:
        d = _invert(d, (x1, x2))
        x1, x2 = x2, x1
    sdata = [d]
    for d, (y1, y2) in zip(data[1:], ranges[1:]):
        if y1 > y2:
            d = _invert(d, (y1, y2))
            y1, y2 = y2, y1
        sdata.append((d-y1) / (y2-y1)
                     * (x2 - x1) + x1)
    return sdata

class ComplexRadar():
    def __init__(self, fig1, variables, ranges,
                 n_ordinate_levels=6):
        angles = np.arange(0, 360, 360./len(variables))

        axes = [fig1.add_axes([0.1,0.1,0.8,0.8], polar=True,
                label = "axes{}".format(i))
                for i in range(len(variables))]

        l, text = axes[0].set_thetagrids(angles,
                                         labels=variables)
        [txt.set_rotation(angle-90) for txt, angle
             in zip(text, angles)]
        for ax in axes[1:]:
            ax.patch.set_visible(False)
            ax.grid("off")
            ax.xaxis.set_visible(False)
        for i, ax in enumerate(axes):
            grid = np.linspace(*ranges[i],
                               num=n_ordinate_levels)
            gridlabel = ["{}".format(round(x,2))
                         for x in grid]
            if ranges[i][0] > ranges[i][1]:
                grid = grid[::-1] # hack to invert grid
                          # gridlabels aren't reversed
            gridlabel[0] = "" # clean up origin
            print(angles[i])
            ax.set_rgrids(grid, labels=gridlabel,
                         angle=angles[i])
            #ax.spines["polar"].set_visible(False)
            ax.set_ylim(*ranges[i])
        # variables for plotting
        self.angle = np.deg2rad(np.r_[angles, angles[0]])
        self.ranges = ranges
        self.ax = axes[0]
    def plot(self, data, *args, **kw):
        sdata = _scale_data(data, self.ranges)
        self.ax.plot(self.angle, np.r_[sdata, sdata[0]], *args, **kw)
    def fill(self, data, *args, **kw):
        sdata = _scale_data(data, self.ranges)
        self.ax.fill(self.angle, np.r_[sdata, sdata[0]], *args, **kw)


if __name__ == "__main__":
    #start timer
    start = timeit.default_timer()

    # init the analyzers
    analyzerBayes = NaiveBayesAnalyzer()
    analyzerPattern = PatternAnalyzer()

    #training first
    resultBayes = analyzerBayes.analyze("train this")
    resultPattern = analyzerPattern.analyze("train this")

    scoreGeneral = sentimentAnalysis("movieData.txt")

    print("general score : " + str(scoreGeneral))

    # running time
    stop = timeit.default_timer()
    print("Running time: " + str(stop - start))



