## After oh-my-zsh installation
1. `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` to install zsh-syntax-highlighting to oh-my-zsh plugins directory
2. `git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/alias-tips` to install alias-tips to oh-my-zsh plugins directory
3. `git clone git://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions` to install zsh-autosuggestions to oh-my-zsh plugins directory

## After nvim installation:
- `pip3 install --upgrade neovim` -> newest python support
- `gem install neovim` -> ruby support

## To create custom tmux layout based on current pane arrangement
1. `tmux list-windows` in tmux console

output will look like this:
```
1: tmux* (5 panes) [155x62] [layout 4551,155x62,0,0{77x62,0,0,39,77x62,78,0[77x31,78,0,43,77x15,78,32,44,77x14,78,48{38x14,78,48,45,38x14,117,48,46}]}] @9 (active)
```
2. copy starting after `layout` (without space) finishing before last `]`
3. paste it to tmuxinator config as window layout

on above example:
```
windows:
    - just_an_example:
        layout: 4551,155x62,0,0{77x62,0,0,39,77x62,78,0[77x31,78,0,43,77x15,78,32,44,77x14,78,48{38x14,78,48,45,38x14,117,48,46}]}
        panes:
            - nvim
            - git status
            - ls
            - cd /
            - nano
```



## 256 color palette (for terminal)
*[source](http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html)*

![](https://github.com/dominikduda/config_files/blob/master/256_color_palette.png)

##### Searchable list:

|Term|Hex    ||Term|Hex    |
|---:|-------||---:|-------|
|0   |#000000||128 |#af00d7|
|1   |#800000||129 |#af00ff|
|2   |#008000||130 |#af5f00|
|3   |#808000||131 |#af5f5f|
|4   |#000080||132 |#af5f87|
|5   |#800080||133 |#af5faf|
|6   |#008080||134 |#af5fd7|
|7   |#c0c0c0||135 |#af5fff|
|8   |#808080||136 |#af8700|
|9   |#ff0000||137 |#af875f|
|10  |#00ff00||138 |#af8787|
|11  |#ffff00||139 |#af87af|
|12  |#0000ff||140 |#af87d7|
|13  |#ff00ff||141 |#af87ff|
|14  |#00ffff||142 |#afaf00|
|15  |#ffffff||143 |#afaf5f|
|16  |#000000||144 |#afaf87|
|17  |#00005f||145 |#afafaf|
|18  |#000087||146 |#afafd7|
|19  |#0000af||147 |#afafff|
|20  |#0000d7||148 |#afd700|
|21  |#0000ff||149 |#afd75f|
|22  |#005f00||150 |#afd787|
|23  |#005f5f||151 |#afd7af|
|24  |#005f87||152 |#afd7d7|
|25  |#005faf||153 |#afd7ff|
|26  |#005fd7||154 |#afff00|
|27  |#005fff||155 |#afff5f|
|28  |#008700||156 |#afff87|
|29  |#00875f||157 |#afffaf|
|30  |#008787||158 |#afffd7|
|31  |#0087af||159 |#afffff|
|32  |#0087d7||160 |#d70000|
|33  |#0087ff||161 |#d7005f|
|34  |#00af00||162 |#d70087|
|35  |#00af5f||163 |#d700af|
|36  |#00af87||164 |#d700d7|
|37  |#00afaf||165 |#d700ff|
|38  |#00afd7||166 |#d75f00|
|39  |#00afff||167 |#d75f5f|
|40  |#00d700||168 |#d75f87|
|41  |#00d75f||169 |#d75faf|
|42  |#00d787||170 |#d75fd7|
|43  |#00d7af||171 |#d75fff|
|44  |#00d7d7||172 |#d78700|
|45  |#00d7ff||173 |#d7875f|
|46  |#00ff00||174 |#d78787|
|47  |#00ff5f||175 |#d787af|
|48  |#00ff87||176 |#d787d7|
|49  |#00ffaf||177 |#d787ff|
|50  |#00ffd7||178 |#d7af00|
|51  |#00ffff||179 |#d7af5f|
|52  |#5f0000||180 |#d7af87|
|53  |#5f005f||181 |#d7afaf|
|54  |#5f0087||182 |#d7afd7|
|55  |#5f00af||183 |#d7afff|
|56  |#5f00d7||184 |#d7d700|
|57  |#5f00ff||185 |#d7d75f|
|58  |#5f5f00||186 |#d7d787|
|59  |#5f5f5f||187 |#d7d7af|
|60  |#5f5f87||188 |#d7d7d7|
|61  |#5f5faf||189 |#d7d7ff|
|62  |#5f5fd7||190 |#d7ff00|
|63  |#5f5fff||191 |#d7ff5f|
|64  |#5f8700||192 |#d7ff87|
|65  |#5f875f||193 |#d7ffaf|
|66  |#5f8787||194 |#d7ffd7|
|67  |#5f87af||195 |#d7ffff|
|68  |#5f87d7||196 |#ff0000|
|69  |#5f87ff||197 |#ff005f|
|70  |#5faf00||198 |#ff0087|
|71  |#5faf5f||199 |#ff00af|
|72  |#5faf87||200 |#ff00d7|
|73  |#5fafaf||201 |#ff00ff|
|74  |#5fafd7||202 |#ff5f00|
|75  |#5fafff||203 |#ff5f5f|
|76  |#5fd700||204 |#ff5f87|
|77  |#5fd75f||205 |#ff5faf|
|78  |#5fd787||206 |#ff5fd7|
|79  |#5fd7af||207 |#ff5fff|
|80  |#5fd7d7||208 |#ff8700|
|81  |#5fd7ff||209 |#ff875f|
|82  |#5fff00||210 |#ff8787|
|83  |#5fff5f||211 |#ff87af|
|84  |#5fff87||212 |#ff87d7|
|85  |#5fffaf||213 |#ff87ff|
|86  |#5fffd7||214 |#ffaf00|
|87  |#5fffff||215 |#ffaf5f|
|88  |#870000||216 |#ffaf87|
|89  |#87005f||217 |#ffafaf|
|90  |#870087||218 |#ffafd7|
|91  |#8700af||219 |#ffafff|
|92  |#8700d7||220 |#ffd700|
|93  |#8700ff||221 |#ffd75f|
|94  |#875f00||222 |#ffd787|
|95  |#875f5f||223 |#ffd7af|
|96  |#875f87||224 |#ffd7d7|
|97  |#875faf||225 |#ffd7ff|
|98  |#875fd7||226 |#ffff00|
|99  |#875fff||227 |#ffff5f|
|100 |#878700||228 |#ffff87|
|101 |#87875f||229 |#ffffaf|
|102 |#878787||230 |#ffffd7|
|103 |#8787af||231 |#ffffff|
|104 |#8787d7||232 |#080808|
|105 |#8787ff||233 |#121212|
|106 |#87af00||234 |#1c1c1c|
|107 |#87af5f||235 |#262626|
|108 |#87af87||236 |#303030|
|109 |#87afaf||237 |#3a3a3a|
|110 |#87afd7||238 |#444444|
|111 |#87afff||239 |#4e4e4e|
|112 |#87d700||240 |#585858|
|113 |#87d75f||241 |#606060|
|114 |#87d787||242 |#666666|
|115 |#87d7af||243 |#767676|
|116 |#87d7d7||244 |#808080|
|117 |#87d7ff||245 |#8a8a8a|
|118 |#87ff00||246 |#949494|
|119 |#87ff5f||247 |#9e9e9e|
|120 |#87ff87||248 |#a8a8a8|
|121 |#87ffaf||249 |#b2b2b2|
|122 |#87ffd7||250 |#bcbcbc|
|123 |#87ffff||251 |#c6c6c6|
|124 |#af0000||252 |#d0d0d0|
|125 |#af005f||253 |#dadada|
|126 |#af0087||254 |#e4e4e4|
|127 |#af00af||255 |#eeeeee|
