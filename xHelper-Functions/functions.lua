function checkForUpdate(game, currentVersion)
  updateCheckThread = createThread(function(t)
    local i = getInternet('UpdateCheck')
    local r = i.getURL('https://raw.githubusercontent.com/Tedward747/Cheat-Engine-Tables/main/' .. game .. '/latestversion.txt')

    if r ~= currentVersion then
      t.synchronize(function()
        al=getAddressList()
        newMR=al.createMemoryRecord();
        newMR2=al.createMemoryRecord();
        newMR3=al.createMemoryRecord();
        newMR.Description = "Update Available, you're on " .. currentVersion .. ", latest is " .. r
        newMR2.Description = "<-- Open Github"
        newMR2.OnActivate = function()
          ShellExecute('https://github.com/Tedward747/Cheat-Engine-Tables/tree/main/' .. game)
        end
        newMR3.Description = "<-- Download new version to Desktop"
        newMR3.OnActivate = function()
          os.execute('curl https://raw.githubusercontent.com/Tedward747/Cheat-Engine-Tables/main/' .. game .. '/' .. game .. '.CT >%userprofile%\\desktop\\' .. game .. '-' .. r .. '.CT')
          local f = io.open(os.getenv('userprofile') .. '\\desktop\\' .. game .. '-' .. r .. '.CT','r')
          if f == nil then
            messageDialog('File download failed, please try again or download manually',mtError,mbOK)
          else
            io.close(f)
            local resp = messageDialog('New table downloaded, would you like to load it now?',mtConfirmation,mbYes,mbNo)
            if resp == 6 then
              -- loadTable(os.getenv('userprofile') .. '\\desktop\\' .. game .. '-' .. r .. '.CT')
              os.execute('%userprofile%\\desktop\\' .. game .. '-' .. r .. '.CT')
              os.exit()
            end
          end
        end
        newMR2.appendToEntry(newMR)
        newMR3.appendToEntry(newMR)
        local i = 0
        local timer = createTimer()
        timer.Interval = 500
        timer.OnTimer = function(timer)
          if i % 2 == 0 then
            newMR.Color = 255
          else
            newMR.Color = 16711935
          end
          i = i + 1
          if i == 6 then timer.destroy() end
        end
      end)
    end

    i.destroy()
  end)
end

print("decodeFunction('" .. encodeFunction(checkForUpdate) .. "')(game, currentVersion)")

decodeFunction('c-pO1Pj4GV6o0cGuU)U+RUHXYAelp2I3%$_iz:Z2yLIfSA#JKOMM7$XHr_Q7%6i9_9mg?J+]PGs]3fBQ5Np*XPthAkj?-,e-E_U+kPu;{?tc_Vci#KG:l8dU-cxw+$JyGg8m-c5[4sSJ^5}Ez1PE@K.j*01k-Tsm[#Np[8c0:xz5@Or0QBZ=.CqTUd%SbF,mqb$;1,py.]xbWCbM57e;XeWH/7f#fy4pu)d3y/VUhxri3XPtc/m([xH=DaZ(M%):/:20!ZI5A%;nXCPmpRbVN@@QGhMD8MvBXbD=0P,GA3F/(a/7Z]Hh{ZgZQ(XLwcjtZlHR?^b9@yN1#?uRy)5K+yaAnlm7jC[Zz6_sg,jL4I.j;;,Od.ZuGq%YS4NkMBA{C.xZ0Iw5pELVLXmHJt=B#J5H-Ua-_rTikB0Tz21b]$gawU+qG2It*U8[ZOlX@y+MXtolpLH*,e?hz*cC9.[D{v*-pQTg9K[0d}bt]@g%^L@n-V(HfFAt.vLe@DejP8fhM%k**Hpa?UEVTQ@I]^tD_8PUY]A_0XDV%!DQT2kCwcUUdP/JzAt$kZw0ZUcEm?Ic4$2Zz$4xla:gPkLi*6lu_6s2T^@SQ/Bkjl3Uf$5%nQccBQFR_vX_Ld3[p@biHOnJWtOL$1u;(H*;c.7[JBuhBP$_)XFGB]DmX$Bx?4H@VibkK@BKBgMVXiq3[TtyF]#qa0M-3n)TbED+Qc/jGX-vgK9{?bhNdGgtp7m?esw#[dHLBQ7LcsSbGU9}cO}1D7R%+gnoW83FnuPS7yUB)w8z7,b/8[M#pgetf-)o;zd?mroaa!q?.FNH[GjwDvR!Shh@K.Zb9Elm*kZr-I(le/?h$ENfj#FWheK-M?E}i[4d*j}w3Rh#l3H,%HVEpp5Ozs_Iyyn^l=+)_qSJ(0hiC)xBrU/OunxAn4!#4^LR!^sw7a2Sq6IK[B$uNo+Fw1#w3C+BoVA#q!$NB57wG?YamWN.k.Uwqn1M^t?9PwY1lq]D,PKdL!mSLRBBoVdq/O0_lp+[^27uL_AFMWa+%!Bs]ap[/Amq27]#HLvQ*]7%/kM0hXjvfAvJu3iBRX=Mf!3}QNT73lY$C7A+8=vU-TAdP${oS5/OA#r=k{?J$i0^_ge}+B7!4EhQmF4mLoW:,wAxoKDTSov^^Hq=*b4}L:JTIE#(%HVB@N5j/VXxd-=SSGgF_lmBr[H$7Kzc9@m/:4MRX9zzL(MC-QWL*$HwwwQMae9@X?/7qRfv2Rhr[_]WsU3.9AY5q-8,c!u14FSaeb[BfpJ+3!5-W7Mx:5OcEpW2+;{!LVhuwfZ:Z-TKxh6+YLhR@;+3d#dxxtA^4UzX3Bp9]L/4]Hy7]k(T=z_ANC*/KLG+}!=g')(game, currentVersion)




function aobScanRegion(SYMBOL, START, END, AOB)
  local CODE = [[aobScanRegion(%s, %s, %s, %s)
  registerSymbol(%s)]]

  if type(START) == 'number' then START = ('%X'):format(START) end
  if type(END) == 'number' then END = ('%X'):format(END) end
  CODE = CODE:format(SYMBOL, START, END, AOB, SYMBOL)

  if not autoAssemble(CODE) then return nil end
  return 1
end

print("aobScanRegion = decodeFunction('" .. encodeFunction(aobScanRegion) .. "') -- (SYMBOL, START, END, AOB)")

aobScanRegion = decodeFunction('c-n1^(q}8U5Ql%W-I5UPNiQnYT(gX2@98aXJ;[ITdflyC5t@+z4^dMTXYhs6H+;ZXdg.J0@PBzn4+QUIy1=D/D7jB$EaQ0lfpbka8G)4Y.,D96:0Tk2DuXAF(pqhT[hJn4;Hy=*5dHD*i3xGyK$p324.C,SQXvDvBNGe;PrX3!3[[YK6,9w%i}]22ePe#b4z.J[e1b;BirZK1OtI9{yZ!oh*pXLlr01R]X/G9]*7rY(mBy[Zn8^)g];]@ry3+KM4kim3tz2E_R+rPnI?L6]G.4c9^}trRRDU]gK%*') -- (SYMBOL, START, END, AOB)




function error_mr(ID)
  local mr = getAddressList().getMemoryRecordByID(ID)
  mr.setDescription("Disabled, can't find method: " .. mr.Description)
  mr.Type = 0
end

print("error_mr = decodeFunction('" .. encodeFunction(error_mr) .. "') -- (ID)")

error_mr = decodeFunction('c-oWpDNPJ!ketlRCB=/U!NS2(5ypT38s!d+3}WFK7Z5Wtu/](YHwFiWl!gWdcZUNE4M2WM0_R4w!vTha2N*RG84ohtWoTqv.:sV?*o]#$4XA:0sD[0/J,.I!C8a2{xY#GNxP)On$oEan%]d79N:=o$N@z=6bYbByPAzdsElw]VEGWs$(ts8u$t,Gx%1KSpQAkeAQ!i0S%gjqr$W1ND$WO6SVBtYl%NkNykSYvwHzNZ!008[?HGc') -- (ID)




function mono_findMethodByArgCount(namespace, classname, methodname, arguments)
  if namespace==nil or classname==nil or methodname==nil or arguments==nil then
    return nil,'invalid parameters'
  end

  local class=mono_findClass(namespace, classname)
  if class and (class~=0) then
    local methods = mono_class_enumMethods(class)
    for i=1, #methods do
      if methods[i].name == methodname then
        local count = 0
        local signature = mono_method_getSignature(methods[i].method)
        if #signature ~= 0 then
          for m in string.gmatch(signature, "[^,]+") do count=count+1 end
        end
        if count == arguments then
          return methods[i].method
        end
      end
    end
  end
  return 0
end

print("mono_findMethodByArgCount = decodeFunction('" .. encodeFunction(mono_findMethodByArgCount) .. "') -- (namespace, classname, methodname, arguments)")

mono_findMethodByArgCount = decodeFunction('c-n1H%Syvg5IvLJJP/^(3#rPj6e*@,fXjPRaHT83jc5oqtpSrtld8K.;Y@*GeuUyzL/PUXr9a[Hua*A*fng5k3{,sz]?]rE[4_dnl^w*H-?iG,Uu/40!n@?ZlLAY-ri4)Cia10CS.16AQh@)(NHSOupf%7UCbv^Z1),BcB}#O2S?_4R%96[GJ/;+l*hR*xCcG0^6c8S?%adSiO}%?3FdV5IE=/DR7Y)mHwmds/KgOUnn.qljN=7c,19-QAs_.7ZTG,5ll4kT;pq.HY?MM3D8kO-fJI+^;Ht2yqNBSA*5}u}9o)oY,va9GK;8xKygD8!Qc#w/5w4e3EZjyD^7g3)qW=vG@Q^n7}4C8E:9;m3YzmwN!+5G8uL*52j:}N7RadDXRvZxpiV(VOg!pn/6lJ$hwOQYiKT*4-lJ15)O_Kb}[cVV.') -- (namespace, classname, methodname, arguments)
