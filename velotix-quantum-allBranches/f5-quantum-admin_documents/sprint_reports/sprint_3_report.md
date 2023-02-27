# Report for Sprint 3: *F5-Quantum*

## Link to Sprint Summary Video
[Summary video link](https://youtu.be/JY9Qe1R2A6M)

## Link to Online Communication Channel (MS Teams/Slack/Discord)
[Discord Server link](https://discord.gg/GHXFXUPkdh)

## Link to Working Prototype
You can access our team's working prototype through our github folder [main](https://github.com/wsu-cpts421-sp22/f5-quantum).

## Team members
1. **Team leader:** Daniel Rouhana (drouhana)
2. Team member 2 Emma Dickenson (emmadickenson4)


### Progress
#### Issues, Points and Hours

<table> 
  <thead>
    <tr>
      <th colspan="2"></th><th colspan="3.5">Point & Hour Counts</th><th colspan="2"></th>
    </tr> 
    <tr>
      <th>Issue</th><th>Linked PR</th><th>Pts<br>Hrs</th><th>Dan</th><th>Emma</th><th>% Complete</th><th>Notes</th>
    </tr>
  </thead> 
  <tbody>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/34">Issue #34</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>8<br/>10</td><td>5<br/>7</td><td>3<br/>3</td><td>100</td><td>Completed NGINX-liboqs container build</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/33">Issue #33</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>3<br/>5</td><td>3<br/>5</td><td>0<br/>0</td><td>100</td><td>NGINX-liboqs container build error</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/35">Issue #35</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>8<br/>10</td><td>4<br/>5</td><td>4<br/>5</td><td>100</td><td>Consolidated development environments</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/36">Issue #36</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>5<br/>10</td><td>4<br/>10</td><td>0<br/>0</td><td>80</td><td>Modular TLS benchmarking</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/41">Issue #41</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>3<br/>5</td><td>0<br/>0</td><td>3<br/>5</td><td>100</td><td>py-app server initialization error</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/42">Issue #42</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>5<br/>10</td><td>4<br/>10</td><td>0<br/>0</td><td>80</td><td>envoy-OQS TLS server initialization error</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/43">Issue #43</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>8<br/>10</td><td>4<br/>7</td><td>2<br/>3</td><td>80</td><td>envoy-OQS TLS server</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/44">Issue #44</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>3<br/>10</td><td>2<br/>10</td><td>0<br/>0</td><td>80</td><td>Modular TLS benchmarking error</td>
    </tr>
    <tr>
      <td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/issues/45">Issue #45</a></td><td><a href="https://github.com/wsu-cpts421-sp22/f5-quantum/pull/37">PR #37</a></td><td>5<br/>10</td><td>0<br/>0</td><td>5<br/>10</td><td>100</td><td>Python front-end app</td>
    </tr>
    <tr><td colspan="2" align="right"><b>Totals:</b></td><td><b>48</b></td><td><b>26</b></td><td><b>17</b></td><td></td><td colspan="2"></td>
    </tr>
  </tbody>
</table>

#### Reflection Statements
| Team Member | Contribution Reflection Statement |
|-------------|-------------------|
|Dan| I feel satisfied with my contributions this sprint. Most of my work was centered around sorting out the envoy-TLS implementation and the modular benchmarking. Good progress and near-complete implementations were made of those, with ongoing work to finalize them planned for future sprints. |
|Emma| I feel like I had a good impact on this sprint. My primary goal was to complete the python application demo with NGINX which I did. I ran into installation errors on my computer which made that goal take longer than expected. In addition, I worked with Dan on other tasks such as the the NGINX-liboqs container build, and the envoy-OQS TLS server. |


### Testing
Most of our testing has been integration testing. Since we do not have much of our front end, and most of our code builds installations, the way we tested most of our code was by having each of our team members run the code on our local devices and check for the expected output. We tested this way and found 100% sucess for the NGINX-liboqs container build. In addition, we tested our NGINX to ensure that it was usable in real applications by deploying a python application with NGINX and it ran successfully.

  
### Communication
 
#### MS Teams/Discord/Slack Messages
<table> 
  <thead>
    <tr>
      <th></th><th colspan="3">Post/Reply Counts</th>
    </tr> 
    <tr>
      <th>Date</th><th>Total</th><th>Dan</th><th>Emma</th>
    </tr>
  </thead> 
  <tbody>
    <tr>
     <td>Ongoing</td><td>176</td><td>92</td><td>84</td>
    </tr>
    <tr><td align="right"><b>Totals:</b></td><td><b>176</b></td><td><b>92</b></td><td><b>84</b></td>
    </tr>
  </tbody>
</table>

#### Video Meetings
<table> 
  <thead>
    <tr>
      <th colspan="2"></th><th colspan="4">In attendance?</th>
    </tr> 
    <tr>
      <th>Date</th><th>Duration (min)</th><th>Dan</th><th>Emma</th>
    </tr>
  </thead> 
  <tbody>
    <tr>
      <td>3/22/22</td><td>30</td><td>&check;</td><td>&check;</td>
    </tr>
    <tr>
      <td>3/29/22</td><td>75</td><td>&check;</td><td>&check;</td>
    </tr>
    <tr>
      <td>4/3/22</td><td>120</td><td>&check;</td><td>&check;</td>
    </tr>
    <tr>
      <td>4/4/22</td><td>180</td><td>&check;</td><td>&check;</td>
    </tr>
    <tr>
      <td>4/5/22</td><td>150</td><td>&check;</td><td>&check;</td>
    </tr>
    <tr>
      <td>4/6/22</td><td>120</td><td>&check;</td><td>&check;</td>
    </tr>
    <tr>
      <td>4/6/22</td><td>60</td><td></td><td></td>
    </tr>
    <tr>
      <td>4/7/22</td><td>120</td><td>&check;</td><td>&check;</td>
    </tr>
    <tr><td align="right"><b>Totals:</b></td><td><b>412</b></td><td><b>7</b></td><td><b>7</b></td>
    </tr>
  </tbody>
</table>
  
#### Face-to-Face Meetings
There were no face to face meetings for the duration of this sprint.

#### Reflection Statements
| Team Member | Communication Reflection Statement |
|-------------|-------------------|
|Dan| Communication went very smoothly this sprint. Emma and I did most of our communication sporadically over discord, meeting sometimes over Zoom to hash things out more efficiently. This worked very well for us, and will likely continue to be the model going forward. |
|Emma| I think the communication for this sprint went very well. I think I did my fair share of communicating by updating both Dan and the sponsor with my progress most days. In addition, it was nice to meet with Dan fairly consistentally over zoom to sort out bugs and plan for the rest of the week. My goal for next sprint is to be involved in more "Github communication" by writing even more issues when necessary. |

### Retrospective

[Retrospective Meeting Recording](https://wsu.zoom.us/rec/share/CY4huja015lrc3u2xI6w6wZnvPGKOiczCQlgpQu-l-xeJHE7MDAWc8yC-Eqy82EY.lft-gI_I2mVj_Yuc)


#### What went well
  - Division of labor was efficient and productive
  - Frequent communication on discord and zoom
  
 #### What we'd like to improve
  - Our communication with our sponsor. It went much better this Sprint, but continued focus on that avenue will provide consistent improvements in productivity and output
  
#### Changes we plan to implement in next sprint period
  - Meet on Thursday and Sunday mornings as a team in addition to our weekly Tuesday meetings to check in and have productive work time together
  - Talk more about our personal schedules early on in the week so that we can plan accordingly
