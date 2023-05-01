function [BI] = MyBlur(I)
myfun = @(non_overlapping_block) mean2(non_overlapping_block.data);
BI = blockproc(I,[4 4],myfun);