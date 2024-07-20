# frozen_string_literal: true

module Fsacars
  class PirepsController < ApplicationController
    def index
      user    = params[:user]
      pass    = params[:pass]
      auth    = params[:auth]
      version = params[:version]

      aircraft = params[:aircraft]
      atcmodel = params[:atcModel]
      atcdata  = params[:atcData]

      # Parse the ATC data
      sar               = atcdata.split("/")
      atc_identifier    = sar[0]
      atc_flight_number = sar[1]
      atc_airline       = sar[2]
      atc_type          =  sar[3]

      origin_latitude       = params[:lat1].gsub!(",", ".")
      origin_longitude      = params[:lon1].gsub!(",", ".")
      destination_latitude  = params[:lat2].gsub!(",", ".")
      destination_longitude = params[:lon2].gsub!(",", ".")
      landing_latitude      = params[:latland].gsub!(",", ".")
      landing_longitude     = params[:lonland].gsub!(",", ".")

      direct_nm = params[:directNM] # greate circle distance
      actual_nm = params[:actualNM] # fligth path distance

      date_short = params[:dateshort] # Date int the following format: MM/DD/YYYY
      date_stamp = params[:datestamp] # Unix epoch UTC
      timeout    = params[:timeout] # HH:MM:SS in UTC
      timeoff    = params[:timeoff] # HH:MM:SS in UTC
      timeon     = params[:timeon] # HH:MM:SS in UTC
      timein     = params[:timein] # HH:MM:SS in UTC

      fstime_out  = params[:fstimeout] # HHMM in UTC
      fstime_off  = params[:fstimeoff] # HHMM in UTC
      fstime_on   = params[:fstimeon] # HHMM in UTC
      fstime_in   = params[:fstimein] # HHMM in UTC

      block_time = params[:blocktime]

      fuel_start = params[:fuelstart] # start fuel weight / pounds
      fuel_stop  = params[:fuelstop] # ending fuel weight / pounds
      fuel_diff  = params[:fueldiff] # fuel used / pounds

      time_of_day           = params[:timoday]
      landing_flight_rules  = params[:landingFR] # flight rule: IFR or VFR, etc.
      landing_speed         = params[:landingKTS] # landing speed in knots
      landing_rate          = params[:landingFPM] # landing rate in feet per minute
      takeoff_weight        = params[:takeoffLBS] # takeoff weight in pounds
      landing_weight        = params[:landingLBS] # landing weight in pounds

      pirep_flight_comments = params[:pirep]

      pause           = params[:pause] # pause tally in seconds
      slew            = params[:slew] # slew tally in seconds
      stall           = params[:stall] # stall tally in seconds
      over_speed      = params[:overspeed] # overspeed tally in seconds
      speed_below_10k = params[:speed10k] # speed greater than 250 knots below 10,000 feet tally in seconds
      sim_rate        = params[:simrate] # sim rate not equal to 1 tally in seconds
      refuel          = params[:refuel]
      crashed         = params[:crashed]
      no_fuel         = params[:nofuel]
      warp_in_nm      = params[:warpNM] # unusual movement detection NM

      fuel_jettison = params[:MILdiffLBS] # tkoff weight - landing weight - fuel used

      takeoff_flight_rule = params[:takeoffFR] # flight rule: IFR or VFR, etc.
      takeoff_wind        = params[:windstart] # wind direction (DDD) and speed (S) token is metar format (DDDSS)
      landing_wind        = params[:windstop] # wind direction (DDD) and speed (S) token is metar format (DDDSS)

      payload    = params[:payload] # difference landing weight and fuel remaining
      fs_version = params[:fsVersion] # Flight Simulator version

      oew     = params[:oew] # Operating Empty Weight in pounds
      zfw     = params[:zfw] # Zero Fuel Weight in pounds
      rollout = params[:rollout] # Rollout from wheels down to 30 knots ground speed

      block_fuel   = params[:blockfuel] # total fuel used, lbs
      enroute_fuel = params[:enroutefuel] # from takeoff to landing fuel used, lbs
      taxi_fuel    = params[:taxifuel] # blockfuel - enroutefuel, lbs
      gmax         = params[:gmax] # max G force
      gmin         = params[:gmin] # min G force

      takeoff_headingwind  = params[:takeoffHWC] # takeoff headingwind component
      takeoff_crosswind    = params[:takeoffXWC] # takeoff crosswind component
      landing_headingwind  = params[:landingHWC] # landing headingwind component
      landing_crosswind    = params[:landingXWC] # landing crosswind component
      average_enroute_wind = params[:hwavg] # average enroute wind

      takeoff_flaps = params[:takeoffflaps] # takeoff flaps setting (0=no flaps)
      landing_flaps = params[:landingflaps] # landing flaps setting (0=no flaps)

      max_taxi_speed_takeoff = params[:omaxtaxi] # max taxi speed prior to takeoff
      max_taxi_speed_landing = params[:dmaxtkof] # max taxi speed after landing

      takeoff_airspeed     = params[:takeoffKTS]
      true_landing_heading = params[:land_truehdg]

      multifpm   = params[:multifpm]
      fpm_array  = multifpm.split(";")
      fpm_string = fpm_array.join(", ")

      Pirep.create(
        user: user,
        pass: pass,
        auth: auth,
        version: version,
        aircraft: aircraft,
        atcmodel: atcmodel,
        # atcdata: atcdata,
        atc_identifier: atc_identifier,
        atc_flight_number: atc_flight_number,
        atc_airline: atc_airline,
        atc_type: atc_type,
        origin_latitude: origin_latitude,
        origin_longitude: origin_longitude,
        destination_latitude: destination_latitude,
        destination_longitude: destination_longitude,
        landing_latitude: landing_latitude,
        landing_longitude: landing_longitude,
        direct_nm: direct_nm,
        actual_nm: actual_nm,
        date_short: date_short,
        date_stamp: date_stamp,
        timeout: timeout,
        timeoff: timeoff,
        timeon: timeon,
        timein: timein,
        fstime_out: fstime_out,
        fstime_off: fstime_off,
        fstime_on: fstime_on,
        fstime_in: fstime_in,
        block_time: block_time,
        fuel_start: fuel_start,
        fuel_stop: fuel_stop,
        fuel_diff: fuel_diff,
        time_of_day: time_of_day,
        landing_flight_rules: landing_flight_rules,
        landing_speed: landing_speed,
        landing_rate: landing_rate,
        takeoff_weight: takeoff_weight,
        landing_weight: landing_weight,
        pirep_flight_comments: pirep_flight_comments,
        pause: pause,
        slew: slew,
        stall: stall,
        over_speed: over_speed,
        speed_below_10k: speed_below_10k,
        sim_rate: sim_rate,
        refuel: refuel,
        crashed: crashed,
        no_fuel: no_fuel,
        warp_in_nm: warp_in_nm,
        fuel_jettison: fuel_jettison,
        takeoff_flight_rule: takeoff_flight_rule,
        takeoff_wind: takeoff_wind,
        landing_wind: landing_wind,
        payload: payload,
        fs_version: fs_version,
        oew: oew,
        zfw: zfw,
        rollout: rollout,
        block_fuel: block_fuel,
        enroute_fuel: enroute_fuel,
        taxi_fuel: taxi_fuel,
        gmax: gmax,
        gmin: gmin,
        takeoff_headingwind: takeoff_headingwind,
        takeoff_crosswind: takeoff_crosswind,
        landing_headingwind: landing_headingwind,
        landing_crosswind: landing_crosswind,
        average_enroute_wind: average_enroute_wind,
        takeoff_flaps: takeoff_flaps,
        landing_flaps: landing_flaps,
        max_taxi_speed_takeoff: max_taxi_speed_takeoff,
        max_taxi_speed_landing: max_taxi_speed_landing,
        takeoff_airspeed: takeoff_airspeed,
        true_landing_heading: true_landing_heading,
        multifpm: multifpm,
        fpm_array: fpm_array,
        fpm_string: fpm_string
      )

      # deve retornar #RXOK# para fsacars reconhecer o relatório como recebido pelo servidor
      # e usar um único pipe para delimitar a URL do relatório visualizável
      url = "#RXOK#|#{SecureRandom.hex}|"

      render plain: url
    end
  end
end
